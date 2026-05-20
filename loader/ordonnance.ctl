LOAD DATA
INFILE *
APPEND
INTO TABLE ORDONNANCE
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_ordonnance, id_consultation, id_medecin, statut_prescription, date_fin_validite "TO_DATE(:date_fin_validite, 'YYYY-MM-DD')", prescription_urgente)
BEGINDATA
9001,8001,2005,"Finalisée","2024-02-10","N"
9002,8002,2002,"En Cours","2024-04-11","N"
9003,8003,2001,"Finalisée","2024-02-12","O"
9004,8004,2005,"Finalisée","2024-02-13","N"
9005,8005,2003,"Finalisée","2024-04-15","N"
9006,8006,2006,"Finalisée","2024-02-16","N"
9007,8007,2004,"Finalisée","2024-02-17","N"
9008,8008,2005,"Finalisée","2024-02-18","N"
9009,8009,2001,"En Cours","2024-03-19","N"
9010,8010,2007,"Finalisée","2024-02-20","N"
9011,8015,2002,"Finalisée","2026-01-20","N"
9012,8016,2003,"Finalisée","2026-01-20","N"
9013,8017,2005,"Finalisée","2026-01-20","N"