DROP TABLE CONTRE_INDIQUE CASCADE CONSTRAINTS;
DROP TABLE SEJOUR CASCADE CONSTRAINTS;
DROP TABLE INTERAGIR CASCADE CONSTRAINTS;
DROP TABLE COMPOSE CASCADE CONSTRAINTS;
DROP TABLE DONNE CASCADE CONSTRAINTS;
DROP TABLE SOUFFRE CASCADE CONSTRAINTS;
DROP TABLE ORDONNANCE CASCADE CONSTRAINTS;
DROP TABLE CONSULTATION CASCADE CONSTRAINTS;
DROP TABLE LIT CASCADE CONSTRAINTS;
DROP TABLE MEDICAMENT CASCADE CONSTRAINTS;
DROP TABLE ALLERGIE CASCADE CONSTRAINTS;
DROP TABLE MEDECIN CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE EXAMEN CASCADE CONSTRAINTS;
DROP TABLE SALLE CASCADE CONSTRAINTS;

CREATE TABLE PATIENT (
    num_securite    NUMBER PRIMARY KEY,
    nom             VARCHAR2(50) NOT NULL,
    prenom          VARCHAR2(50) NOT NULL,
    date_naissance  DATE,
    groupe_sanguin  VARCHAR2(3) CHECK (groupe_sanguin IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    enceinte        CHAR(1) CHECK (enceinte IN ('O', 'N')),
    telephone       VARCHAR2(15),
    adresse         VARCHAR2(100),
    lieu_naissance  VARCHAR2(50)
);

CREATE TABLE MEDECIN (
    id_medecin      NUMBER PRIMARY KEY,
    nom             VARCHAR2(50) NOT NULL,
    prenom          VARCHAR2(50) NOT NULL,
    specialite      VARCHAR2(50),
    telephone       VARCHAR2(15)
);

CREATE TABLE ALLERGIE (
    id_allergie     NUMBER PRIMARY KEY,
    nom             VARCHAR2(100) NOT NULL,
    type_allergie   VARCHAR2(50)
);

CREATE TABLE MEDICAMENT (
    id_medicament        NUMBER PRIMARY KEY,
    nom                  VARCHAR2(100) NOT NULL,
    age_max_autorise     NUMBER,
    age_min_autorise     NUMBER,
    interdit_femme_enceinte CHAR(1) CHECK (interdit_femme_enceinte IN ('O', 'N'))
);

CREATE TABLE EXAMEN (
    id_examen       NUMBER PRIMARY KEY,
    nom             VARCHAR2(100) NOT NULL,
    type_examen     VARCHAR2(50)
);

CREATE TABLE SALLE (
    id_salle        NUMBER PRIMARY KEY,
    type_salle      VARCHAR2(50) NOT NULL
); 

CREATE TABLE LIT (
    id_lit   NUMBER PRIMARY KEY,
    id_salle NUMBER NOT NULL,
    type_lit VARCHAR2(50),
    CONSTRAINT fk_lit_salle FOREIGN KEY (id_salle) REFERENCES SALLE(id_salle)
);

CREATE TABLE CONSULTATION (
    id_consultation     NUMBER PRIMARY KEY,
    id_medecin          NUMBER NOT NULL,
    num_securite        NUMBER NOT NULL,
    motif               VARCHAR2(255) NOT NULL,
    observation         VARCHAR2(2000),
    date_heure_debut    DATE NOT NULL,
    date_heure_fin      DATE,
    CONSTRAINT fk_consultation_patient FOREIGN KEY (num_securite) REFERENCES PATIENT(num_securite),
    CONSTRAINT fk_consultation_medecin FOREIGN KEY (id_medecin) REFERENCES MEDECIN(id_medecin),
    CONSTRAINT chk_dates_consultation CHECK (date_heure_fin IS NULL OR date_heure_fin >= date_heure_debut)
);

CREATE TABLE ORDONNANCE (
    id_ordonnance           NUMBER PRIMARY KEY,
    id_consultation         NUMBER NOT NULL,
    id_medecin              NUMBER NOT NULL,
    statut_prescription     VARCHAR2(20) CHECK (statut_prescription IN ('En Cours', 'Finalisée', 'Annulée')),
    date_fin_validite       DATE,
    prescription_urgente    CHAR(1) CHECK (prescription_urgente IN ('O', 'N')),
    CONSTRAINT fk_ordonnance_consultation FOREIGN KEY (id_consultation) REFERENCES CONSULTATION(id_consultation),
    CONSTRAINT fk_ordonnance_medecin FOREIGN KEY (id_medecin) REFERENCES MEDECIN(id_medecin),
    CONSTRAINT uk_ordonnance_consultation UNIQUE (id_consultation)
);

CREATE TABLE SOUFFRE (
    num_securite NUMBER NOT NULL,
    id_allergie  NUMBER NOT NULL,
    symptomes    VARCHAR2(500),
    CONSTRAINT pk_souffre PRIMARY KEY (num_securite, id_allergie),
    CONSTRAINT fk_souffre_patient FOREIGN KEY (num_securite) REFERENCES PATIENT(num_securite),
    CONSTRAINT fk_souffre_allergie FOREIGN KEY (id_allergie) REFERENCES ALLERGIE(id_allergie)
);

CREATE TABLE DONNE (
    id_consultation NUMBER NOT NULL,
    id_examen       NUMBER NOT NULL,
    DATE_HEURE_EXAMEN TIMESTAMP, 
    RESULTAT VARCHAR2(255),       
    CONSTRAINT pk_donne PRIMARY KEY (id_consultation, id_examen),
    CONSTRAINT fk_donne_consultation FOREIGN KEY (id_consultation) REFERENCES CONSULTATION(id_consultation),
    CONSTRAINT fk_donne_examen FOREIGN KEY (id_examen) REFERENCES EXAMEN(id_examen)
); 
CREATE TABLE COMPOSE (
    id_ordonnance   NUMBER NOT NULL,
    id_medicament   NUMBER NOT NULL,
    dosage          VARCHAR2(100),
    PRIMARY KEY (id_ordonnance, id_medicament),
    CONSTRAINT fk_compose_ordonnance FOREIGN KEY (id_ordonnance) REFERENCES ORDONNANCE(id_ordonnance),
    CONSTRAINT fk_compose_medicament FOREIGN KEY (id_medicament) REFERENCES MEDICAMENT(id_medicament)
);

CREATE TABLE INTERAGIR (
    id_medicament1   NUMBER NOT NULL,
    id_medicament2   NUMBER NOT NULL,
    gravite         VARCHAR2(20),
    type_interaction VARCHAR2(50),
    recommandation  VARCHAR2(255),
    PRIMARY KEY (id_medicament1, id_medicament2),
    CONSTRAINT fk_interagir_med1 FOREIGN KEY (id_medicament1) REFERENCES MEDICAMENT(id_medicament),
    CONSTRAINT fk_interagir_med2 FOREIGN KEY (id_medicament2) REFERENCES MEDICAMENT(id_medicament),
    -- Contrainte pour éviter A interagit avec B et B interagit avec A (un seul enregistrement par paire)
    CONSTRAINT chk_ordre_medoc CHECK (id_medicament1 < id_medicament2)
);

CREATE TABLE SEJOUR (
    num_securite    NUMBER NOT NULL,
    id_lit          NUMBER NOT NULL,
    date_heure_arrivee TIMESTAMP,
    date_heure_sortie TIMESTAMP,
    PRIMARY KEY (num_securite, id_lit, date_heure_arrivee),
    CONSTRAINT fk_sejour_patient FOREIGN KEY (num_securite) REFERENCES PATIENT(num_securite),
    CONSTRAINT fk_sejour_lit FOREIGN KEY (id_lit) REFERENCES LIT(id_lit),
    -- Contrainte Temporelle Complexe (nécessite un trigger pour gérer le chevauchement, mais on peut mettre la base ici)
    CONSTRAINT chk_date_sejour CHECK (date_heure_sortie IS NULL OR date_heure_sortie > date_heure_arrivee)
);

CREATE TABLE CONTRE_INDIQUE (
    id_allergie     NUMBER NOT NULL,
    id_medicament   NUMBER NOT NULL,
    niveau_alerte   VARCHAR2(20),
    justification   VARCHAR2(255),
    PRIMARY KEY (id_allergie, id_medicament),
    CONSTRAINT fk_ci_allergie FOREIGN KEY (id_allergie) REFERENCES ALLERGIE(id_allergie),
    CONSTRAINT fk_ci_medicament FOREIGN KEY (id_medicament) REFERENCES MEDICAMENT(id_medicament)
);