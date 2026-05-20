LOAD DATA
INFILE *
APPEND
INTO TABLE PATIENT
FIELDS TERMINATED BY "," OPTIONALLY ENCLOSED BY '"'
(num_securite, nom, prenom, date_naissance "TO_DATE(:date_naissance, 'YYYY-MM-DD')", groupe_sanguin, enceinte, telephone, adresse, lieu_naissance)
BEGINDATA
100001,"Martin","Jean","1980-05-15","A+","N","0612345678","12 Rue de Paris","Paris"
100002,"Dubois","Marie","1992-08-22","O+","O","0623456789","25 Avenue Victor Hugo","Lyon"
100003,"Bernard","Pierre","1975-03-10","B-","N","0634567890","8 Rue de la République","Marseille"
100004,"Thomas","Sophie","1988-11-30","AB+","N","0645678901","15 Boulevard Saint-Michel","Toulouse"
100005,"Robert","Luc","1965-07-04","A-","N","0656789012","3 Place de la Mairie","Bordeaux"
100006,"Richard","Julie","1995-02-18","O-","O","0667890123","42 Rue du Commerce","Lille"
100007,"Petit","Marc","1982-09-25","B+","N","0678901234","7 Avenue Foch","Nice"
100008,"Durand","Isabelle","1970-12-05","A+","N","0689012345","18 Rue de la Gare","Strasbourg"
100009,"Leroy","Philippe","1990-06-14","AB-","N","0690123456","22 Cours Gambetta","Nantes"
100010,"Moreau","Catherine","1985-04-03","O+","O","0601234567","9 Rue du Château","Rennes"
100011,"Simon","Antoine","1978-01-19","B-","N","0619876543","31 Allée des Tilleuls","Montpellier"
100012,"Laurent","Valérie","1993-10-08","A+","N","0628765432","5 Impasse des Roses","Toulon"
100013,"Michel","David","1968-07-22","O-","N","0637654321","14 Rue Principale","Grenoble"
100014,"Garcia","Émilie","1987-03-27","AB+","O","0646543210","27 Avenue Jean Jaurès","Dijon"
100015,"Rodriguez","Thomas","1972-11-11","B+","N","0655432109","6 Place du Marché","Clermont-Ferrand"
100016,"Benoit","Claire","1983-02-12","A+","N","0699988776","12 Rue du Centre","Paris"
100017,"Lambert","Paul","1979-09-03","O+","N","0677889988","84 Rue Victor Hugo","Lille"
100018,"Renard","Lucie","1991-06-21","B-","N","0688776655","2 Avenue des Champs","Bordeaux"
100019,"Marchand","Hugo","1986-12-30","AB+","N","0666775544","19 Rue du Port","Nice"
100020,"Dupont","Alice","1989-09-12","A+","O","0611223344","10 Rue du Moulin","Paris"
100021,"Fabre","Louis","1994-03-18","B-","N","0622334455","5 Rue des Lilas","Lyon"
100022,"Morel","Claire","1980-12-01","O+","N","0633445566","14 Avenue des Fleurs","Marseille"
100023,"Gautier","Hugo","1976-05-05","AB+","N","0644556677","8 Boulevard Victor","Toulouse"
100024,"Roussel","Emma","1992-07-22","O-","O","0655667788","12 Rue de l'Église","Bordeaux"
100025,"Noel","Antoine","1985-11-11","A-","N","0666778899","20 Place du Marché","Nice"
100026,"Lemoine","Julie","1991-02-25","B+","O","0677889900","6 Allée des Roses","Strasbourg"
100027,"Poirier","Lucas","1988-08-30","AB-","N","0688990011","3 Rue du Château","Nantes"
100028,"Marchal","Inès","1993-06-16","A+","O","0699001122","9 Avenue du Parc","Rennes"
100029,"Giraud","Maxime","1979-10-09","O+","N","0600112233","15 Rue des Lilas","Montpellier"
100030,"PetitEnfant","Lucas","2015-06-01","A+","N","0612345679","10 Rue de l'école","Paris"
100031,"JeuneFille","Emma","2012-09-15","O+","N","0623456790","5 Avenue des Lilas","Lyon"
100032,"Bébé","Noah","2018-03-20","B+","N","0634567891","12 Rue du Parc","Marseille"