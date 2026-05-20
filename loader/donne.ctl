LOAD DATA
INFILE *
APPEND
INTO TABLE DONNE
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_consultation, id_examen, date_heure_examen "TO_TIMESTAMP(:date_heure_examen, 'YYYY-MM-DD HH24:MI:SS')", resultat)
BEGINDATA
8001,5002,"2024-01-10 09:15:00","Normal"
8002,5004,"2024-01-11 10:20:00","Grossesse évolutive"
8003,5005,"2024-01-12 14:45:00","Anomalie détectée"
8006,5006,"2024-01-16 10:00:00","Pas d'anomalie"
8007,5008,"2024-01-17 14:30:00","Allergie confirmée"
8009,5002,"2024-01-19 15:10:00","Cholestérol élevé"
8010,5001,"2024-01-20 11:30:00","Bronchite"
8005,5004,"2024-01-15 16:15:00","Écho normale"