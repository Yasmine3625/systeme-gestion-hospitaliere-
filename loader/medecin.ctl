LOAD DATA
INFILE *
APPEND
INTO TABLE MEDECIN
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(id_medecin, nom, prenom, specialite, telephone)
BEGINDATA
2001,"Dupont","Pierre","Cardiologue","0145123456"
2002,"Lemoine","Anne","Pédiatre","0145234567"
2003,"Girard","Michel","Gynécologue","0145345678"
2004,"Rousseau","Laura","Dermatologue","0145456789"
2005,"Fournier","Jacques","Généraliste","0145567890"
2006,"Mercier","Christine","Neurologue","0145678901"
2007,"Blanc","Éric","Radiologue","0145789012"
2008,"Faure","Nathalie","Ophtalmologue","0145890123"
2009,"Lopez","Jean","Orthopédiste","0145901234"
2010,"Sanchez","Marie","Psychiatre","0145012345"