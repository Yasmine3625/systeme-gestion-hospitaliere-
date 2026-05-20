

GRANT CREATE VIEW TO PROJET;


CREATE OR REPLACE VIEW VUE_DOSSIER_PATIENT AS
SELECT
    P.num_securite,
    P.nom AS nom_patient,
    P.prenom AS prenom_patient,
    P.date_naissance,
    P.groupe_sanguin,
    P.enceinte,
    P.telephone,
    P.adresse,
    P.lieu_naissance,
    C.id_consultation AS consultation,
    C.motif,
    C.date_heure_debut,
    M.nom AS nom_medecin,
    M.prenom AS prenom_medecin,
    O.id_ordonnance AS ordonnance,
    O.prescription_urgente urgent
FROM
    PATIENT P,       
    CONSULTATION C,
    MEDECIN M,
    ORDONNANCE O
WHERE
    P.num_securite = C.num_securite (+)
    AND C.id_medecin = M.id_medecin (+)
    AND C.id_consultation = O.id_consultation (+)
ORDER BY
    P.num_securite,
    C.date_heure_debut DESC;

GRANT SELECT ON VUE_DOSSIER_PATIENT TO MEDECIN;

CREATE OR REPLACE VIEW VUE_MEDICAMENTS_INTERDITS AS
SELECT
    P.num_securite,
    P.nom AS nom_patient,
    P.prenom AS prenom_patient,
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM P.date_naissance)
        - CASE WHEN TO_CHAR(SYSDATE,'MMDD') < TO_CHAR(P.date_naissance,'MMDD') THEN 1 ELSE 0 END AS age,
    P.enceinte,
    M.id_medicament,
    M.nom AS medicament,
    M.age_min_autorise,
    M.age_max_autorise,
    M.interdit_femme_enceinte,
    A.nom AS allergie
FROM PATIENT P
CROSS JOIN MEDICAMENT M
LEFT JOIN SOUFFRE S 
    ON S.num_securite = P.num_securite
LEFT JOIN ALLERGIE A 
    ON A.id_allergie = S.id_allergie
LEFT JOIN CONTRE_INDIQUE CI 
    ON CI.id_allergie = A.id_allergie
    AND CI.id_medicament = M.id_medicament
WHERE
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM P.date_naissance)
        - CASE WHEN TO_CHAR(SYSDATE,'MMDD') < TO_CHAR(P.date_naissance,'MMDD') THEN 1 ELSE 0 END < M.age_min_autorise
    OR EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM P.date_naissance)
        - CASE WHEN TO_CHAR(SYSDATE,'MMDD') < TO_CHAR(P.date_naissance,'MMDD') THEN 1 ELSE 0 END > M.age_max_autorise
    OR (P.enceinte = 'O' AND M.interdit_femme_enceinte = 'O')
    OR CI.id_allergie IS NOT NULL;



GRANT SELECT ON VUE_MEDICAMENTS_INTERDITS TO MEDECIN;


CREATE OR REPLACE VIEW VUE_TRAITEMENTS_HISTORIQUES AS
SELECT 
    P.num_securite,
    P.nom AS nom_patient,
    P.prenom AS prenom_patient,
    C.id_consultation,
    C.date_heure_debut AS date_consultation,
    M.nom AS nom_medecin,
    M.prenom AS prenom_medecin,
    O.id_ordonnance,
    O.date_fin_validite,
    O.statut_prescription,
    O.prescription_urgente AS urgence,
    MED.id_medicament,
    MED.nom AS medicament,
    CO.dosage
FROM PATIENT P,
     CONSULTATION C,
     MEDECIN M,
     ORDONNANCE O,
     COMPOSE CO,
     MEDICAMENT MED
WHERE P.num_securite = C.num_securite(+)
  AND C.id_medecin = M.id_medecin(+)
  AND C.id_consultation = O.id_consultation(+)
  AND O.id_ordonnance = CO.id_ordonnance(+)
  AND CO.id_medicament = MED.id_medicament(+)
ORDER BY P.num_securite, C.date_heure_debut DESC, O.id_ordonnance;


GRANT SELECT ON VUE_TRAITEMENTS_HISTORIQUES TO MEDECIN;
