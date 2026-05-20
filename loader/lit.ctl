LOAD DATA
INFILE *
APPEND
INTO TABLE LIT
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_lit, id_salle, type_lit)
BEGINDATA
7001,6001,"Standard"
7002,6001,"Standard"
7003,6002,"Standard"
7004,6002,"Standard"
7005,6005,"Urgence"
7006,6005,"Urgence"
7007,6006,"Soins intensifs"
7008,6006,"Soins intensifs"
7009,6007,"Maternité"
7010,6008,"Pédiatrie"