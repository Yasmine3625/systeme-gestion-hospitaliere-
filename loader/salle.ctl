LOAD DATA
INFILE *
APPEND
INTO TABLE SALLE
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_salle, type_salle)
BEGINDATA
6001,"Chambre simple"
6002,"Chambre double"
6003,"Salle d'opération"
6004,"Salle de réveil"
6005,"Urgences"
6006,"Soins intensifs"
6007,"Maternité"
6008,"Pédiatrie"
6009,"Radiologie"
6010,"Laboratoire"