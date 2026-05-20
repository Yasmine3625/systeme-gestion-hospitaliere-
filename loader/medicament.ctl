LOAD DATA
INFILE *
APPEND
INTO TABLE MEDICAMENT
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_medicament, nom, age_max_autorise, age_min_autorise, interdit_femme_enceinte)
BEGINDATA
4001,"Paracétamol",120,3,"N"
4002,"Ibuprofène",80,6,"O"
4003,"Amoxicilline",999,0,"N"
4004,"Ventoline",999,4,"N"
4005,"Insuline",999,12,"N"
4006,"Morphine",999,18,"O"
4007,"Aspirine",999,16,"O"
4008,"Doliprane",100,0,"N"
4009,"Augmentin",999,0,"N"
4010,"Xanax",999,25,"O"
4011,"Levothyrox",999,18,"N"
4012,"Kardegic",999,50,"N"
4013,"Pediatrix",15,0,"N"
4050,"Sirop Croissance",12,0,"N"
4051,"Pommade Bebé Zen",5,0,"N"
4052,"Vitamines Junior",12,0,"N"