OPTIONS (DIRECT=TRUE)
LOAD DATA
INFILE *
APPEND
INTO TABLE COMPOSE
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_ordonnance, id_medicament, dosage)
BEGINDATA
9001,4001,"500mg 3x/jour"
9003,4012,"75mg 1x/jour"
9006,4001,"1000mg 2x/jour"
9008,4003,"1g 2x/jour"
9010,4001,"1000mg 3x/jour"
9002,4005,"10 unités soir"
9011,4013,"1 dose/jour"
9011,4050,"10ml/jour"
9011,4051,"Appliquer 2x/jour"
9011,4052,"2 comprimés/jour"

9012,4013,"1 dose/jour"
9012,4050,"10ml/jour"
9012,4051,"Appliquer 2x/jour"
9012,4052,"2 comprimés/jour"

9013,4013,"1 dose/jour"
9013,4050,"10ml/jour"
9013,4051,"Appliquer 2x/jour"
9013,4052,"2 comprimés/jour"