LOAD DATA
INFILE *
APPEND
INTO TABLE EXAMEN
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_examen, nom, type_examen)
BEGINDATA
5001,"Radio poumon","Radiologie"
5002,"Prise de sang","Biologie"
5003,"IRM cérébrale","Imagerie"
5004,"Échographie abdominale","Échographie"
5005,"ECG","Cardiologie"
5006,"Scanner thoracique","Scanner"
5007,"Fibroscopie","Endoscopie"
5008,"Test allergique","Allergologie"
5009,"Biopsie","Anatomopathologie"
5010,"Épreuve d'effort","Cardiologie"