-- ===========================================
-- PARAMÈTRES GLOBAUX SQL*PLUS
-- ===========================================
CLEAR COLUMNS
SET WRAP ON
SET LINESIZE 100  -- On reste à 200 pour maximiser l'espace

-- ===========================================
-- FORMATAGE DES COLONNES DE LA VUE VUE_DOSSIER_PATIENT
-- Largeur totale ajustée sous 200 pour éviter le chevauchement
-- ===========================================

-- Colonnes Patient
COLUMN num_securite FORMAT 999999999999999 HEADING 'NUM_SEC'  -- Corrigé le format numérique
COLUMN nom_patient FORMAT A15 TRU HEADING 'NOM'
COLUMN prenom_patient FORMAT A15 TRU HEADING 'PRENOM'
COLUMN date_naissance FORMAT A10 HEADING 'DATE_NAIS'
COLUMN groupe_sanguin FORMAT A3 HEADING 'GRP'
COLUMN enceinte FORMAT A1 HEADING 'E'
COLUMN telephone FORMAT A12 TRU HEADING 'TEL'
COLUMN adresse FORMAT A25 TRU HEADING 'ADRESSE'
COLUMN lieu_naissance FORMAT A12 TRU HEADING 'LIEU_NAIS'

-- Colonnes Consultation/Ordonnance
COLUMN id_consultation FORMAT 99999 HEADING 'ID_CONS'
COLUMN motif FORMAT A15 TRU 
COLUMN date_heure_debut FORMAT A18 TRU HEADING 'DATE_HEURE'
COLUMN nom_medecin FORMAT A12 TRU HEADING 'NOM_MED'
COLUMN prenom_medecin FORMAT A12 TRU HEADING 'PRENOM_MED'
COLUMN id_ordonnance FORMAT 99999 HEADING 'ID_ORD'
COLUMN prescription_urgente FORMAT A3 TRU HEADING 'URG'

-- ===========================================
-- EXÉCUTION DE LA REQUÊTE SUR LA VUE
-- ===========================================
SELECT *
FROMVUE_MEDICAMENTS_INTERDITS TO MEDECIN;
WHERE num_securite = '100002';


SET LINESIZE 150
SET PAGESIZE 50

-- Colonnes texte
COLUMN NOM FORMAT A15
COLUMN PRENOM FORMAT A15
COLUMN MEDICAMENT FORMAT A20
COLUMN ALLERGIE FORMAT A15

-- Colonnes numériques
COLUMN AGE FORMAT 999
COLUMN AGE_MIN_AUTORISE FORMAT 999
COLUMN AGE_MAX_AUTORISE FORMAT 999
COLUMN ID_MEDICAMENT FORMAT 9999

-- Colonnes avec O/N
COLUMN E FORMAT A1
COLUMN I FORMAT A1



SELECT *
FROM VUE_ALERTE_MEDICAMENTS
WHERE num_securite = 200002;
