LOAD DATA
INFILE *
APPEND
INTO TABLE INTERAGIR
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_medicament1, id_medicament2, gravite, type_interaction, recommandation)
BEGINDATA
4001,4007,"Moyenne","Addition d'effets","Surveiller saignements"
4002,4006,"Haute","Potentialisation","Éviter association"
4003,4010,"Moyenne","Interactions diverses","Adapter dosage"
4001,4010,"Basse","Modérée","Prudence"
4005,4011,"Moyenne","Métabolique","Contrôle glycémie"
