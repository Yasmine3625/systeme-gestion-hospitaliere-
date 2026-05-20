LOAD DATA
INFILE *
APPEND
INTO TABLE SOUFFRE
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(num_securite, id_allergie, symptomes)
BEGINDATA
100001,3001,"Rash cutané"
100002,3002,"Œdème de Quincke"
100003,3006,"Urtiaire"
100004,3005,"Troubles digestifs"
100007,3004,"Éternuements"
100012,3007,"Conjonctivite"
100006,3003,"Asthme"
100009,3008,"Vomissements"
100014,3009,"Démangeaisons"
100001,3003,"Rhinite"
100016,3001,"Rougeurs cutanées"
100016,3002,"Gonflement léger"

100017,3001,"Réaction médicamenteuse"
100017,3003,"Difficultés respiratoires"

100018,3001,"Urticaire"
100018,3006,"Saignements de nez après prise"

100019,3002,"Choc anaphylactique léger"
100019,3003,"Toux persistante"

