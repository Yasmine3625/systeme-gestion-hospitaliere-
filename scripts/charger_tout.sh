#!/bin/bash
# Script de chargement massif global pour le projet LSIN513

# --- Variables de Connexion ---
# Assurez-vous que le mot de passe est correct
USERID="projet/projet"

echo "============================================="
echo "Démarrage du chargement massif de la base de données..."
echo "============================================="

# ----------------------------------------------------
# 1. ENTITÉS DE BASE (Sans Clé Étrangère, sauf celles qui s'auto-référencent)
# ----------------------------------------------------

echo "Chargement 1/6 : PATIENT, MEDECIN, ALLERGIE, MEDICAMENT, SALLE, EXAMEN..."
sqlldr userid=$USERID control=patient.ctl log=patient.log
sqlldr userid=$USERID control=medecin.ctl log=medecin.log
sqlldr userid=$USERID control=allergie.ctl log=allergie.log
sqlldr userid=$USERID control=medicament.ctl log=medicament.log
sqlldr userid=$USERID control=salle.ctl log=salle.log
sqlldr userid=$USERID control=examen.ctl log=examen.log

# ----------------------------------------------------
# 2. ENTITÉS DEUXIÈME NIVEAU (Dépendent des entités de base)
# ----------------------------------------------------

echo "Chargement 2/6 : LIT (dépend de SALLE)..."
sqlldr userid=$USERID control=lit.ctl log=lit.log

echo "Chargement 3/6 : Associations simples (SOUFFRE, CI, INTERAGIR)..."
sqlldr userid=$USERID control=souffre.ctl log=souffre.log
sqlldr userid=$USERID control=ci.ctl log=ci.log
sqlldr userid=$USERID control=interagir.ctl log=interagir.log

# ----------------------------------------------------
# 3. ÉVÉNEMENTS CENTRAUX (Dépendent des entités de base)
# ----------------------------------------------------

echo "Chargement 4/6 : CONSULTATION (dépend de PATIENT, MEDECIN)..."
sqlldr userid=$USERID control=consultation.ctl log=consultation.log

echo "Chargement 5/6 : ORDONNANCE (dépend de CONSULTATION, MEDECIN)..."
sqlldr userid=$USERID control=ordonnance.ctl log=ordonnance.log

# ----------------------------------------------------
# 4. TABLES D'ASSOCIATION FINALES (Dépendent des événements)
# ----------------------------------------------------

echo "Chargement 6/6 : COMPOSE, DONNE, SEJOUR..."
sqlldr userid=$USERID control=compose.ctl log=compose.log
sqlldr userid=$USERID control=donne.ctl log=donne.log
sqlldr userid=$USERID control=sejour.ctl log=sejour.log


echo "============================================="
echo "PROCESSUS DE CHARGEMENT GLOBAL TERMINÉ."
echo "Veuillez vérifier les fichiers .log pour toute erreur de contrainte."
echo "============================================="