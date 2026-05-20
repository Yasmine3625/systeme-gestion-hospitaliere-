LOAD DATA
INFILE *
APPEND
INTO TABLE CONSULTATION
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_consultation, id_medecin, num_securite, motif, observation, date_heure_debut "TO_DATE(:date_heure_debut, 'YYYY-MM-DD HH24:MI')", date_heure_fin "TO_DATE(:date_heure_fin, 'YYYY-MM-DD HH24:MI')")
BEGINDATA
8001,2005,100001,"Fièvre et maux de tête","État stable","2024-01-10 09:00","2024-01-10 09:30"
8002,2002,100002,"Suivi grossesse","3ème mois","2024-01-11 10:00","2024-01-11 10:45"
8003,2001,100003,"Douleur thoracique","À surveiller","2024-01-12 14:30","2024-01-12 15:15"
8004,2005,100004,"Rhume","Repos conseillé","2024-01-13 11:00","2024-01-13 11:20"
8005,2003,100002,"Échographie","Grossesse normale","2024-01-15 16:00","2024-01-15 16:40"
8006,2006,100007,"Migraines sévères","Scanner prescrit","2024-01-16 09:30","2024-01-16 10:10"
8007,2004,100012,"Problème cutané","Allergie suspectée","2024-01-17 14:00","2024-01-17 14:50"
8008,2005,100009,"Vaccination","Vaccin tétanos","2024-01-18 10:30","2024-01-18 10:50"
8009,2001,100015,"Contrôle tension","Hypertension légère","2024-01-19 15:00","2024-01-19 15:40"
8010,2007,100006,"Radio poumon","Bronchite","2024-01-20 11:15","2024-01-20 11:45"
8011,2004,100016,"Douleurs abdominales","Examens complémentaires","2025-01-15 09:30",
8012,2006,100017,"Difficultés respiratoires","Oxygénothérapie en cours","2025-01-14 15:10",
8013,2003,100018,"Infection suspectée","Analyse en attente","2025-01-15 07:00",
8014,2005,100019,"Fracture probable","Radiographie programmée","2025-01-13 12:00",
8015,2002,100030,"Bilan pédiatrique","Rien à signaler","2025-12-20 09:00","2025-12-20 09:30"
8016,2003,100031,"Vaccination","OK","2025-12-20 10:00","2025-12-20 10:20"
8017,2005,100032,"Suivi enfant","Rien à signaler","2025-12-20 11:00","2025-12-20 11:20"
