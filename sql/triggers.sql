CREATE OR REPLACE TRIGGER TRG_VERIF_INTERACTION
BEFORE INSERT ON COMPOSE
FOR EACH ROW
DECLARE
    v NUMBER := 0; 
BEGIN
    SELECT COUNT(*) INTO v
    FROM COMPOSE C, INTERAGIR I
    WHERE C.id_ordonnance = :NEW.id_ordonnance
    AND (
        (C.id_medicament = I.id_medicament1 AND I.id_medicament2 = :NEW.id_medicament)
        OR 
        (C.id_medicament = I.id_medicament2 AND I.id_medicament1 = :NEW.id_medicament)
    );

    IF v > 0 THEN
        RAISE_APPLICATION_ERROR(-20015, 'Interaction detectee');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_VERIF_ALLERGIES
BEFORE INSERT ON COMPOSE 
FOR EACH ROW 
DECLARE 
    v NUMBER := 0;
    p NUMBER;
BEGIN 

    SELECT patient.num_securite
    INTO p
    FROM patient,
         consultation,
         ordonnance
    WHERE ordonnance.id_consultation = consultation.id_consultation
      AND consultation.num_securite = patient.num_securite
      AND ordonnance.id_ordonnance = :NEW.id_ordonnance;

    SELECT COUNT(*)
    INTO v
    FROM souffre s,
         contre_indique ci
    WHERE ci.id_allergie = s.id_allergie
      AND s.num_securite = p
      AND ci.id_medicament = :NEW.id_medicament;

    IF v > 0 THEN
        RAISE_APPLICATION_ERROR(-20015, 'Allergie detectee');
    END IF;

END;
/

CREATE OR REPLACE TRIGGER trg_disponibilite_lit
BEFORE INSERT ON SEJOUR
FOR EACH ROW
DECLARE
    v NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v
    FROM SEJOUR
    WHERE id_lit = :NEW.id_lit
    AND date_heure_sortie IS NULL;

    IF v > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'lit déjà occupé par un patient.');
    END IF;
END;
/