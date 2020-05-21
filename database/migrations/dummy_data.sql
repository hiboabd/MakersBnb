-- THIS WILL HAVE userID OF 1
INSERT INTO Users (first_name, last_name, email, password) VALUES ('Aretha', 'Franklin', 'AFranklin@gmail.com', 'iSAYaLITTLEprayer');
-- THIS WILL HAVE userID OF 2
INSERT INTO Users (first_name, last_name, email, password) VALUES ('Marvin', 'Gaye', 'MGaye@gmail.com', 'letsGETitON');
-- THIS WILL HAVE userID OF 3
INSERT INTO Users (first_name, last_name, email, password) VALUES ('Johnny', 'Cash', 'JCash@gmail.com', 'iWALKtheLINE');
-- THIS WILL HAVE userID OF 4
INSERT INTO Users (first_name, last_name, email, password) VALUES ('Dolly', 'Parton', 'DParton@gmail.com', '9to5');
-- THIS WILL HAVE userID OF 5
INSERT INTO Users (first_name, last_name, email, password) VALUES ('Diana', 'Ross', 'DRoss@gmail.com', 'AINTnoMOUNTAIN');


-- THIS WILL HAVE spaceID OF 1
INSERT INTO Spaces (name, description, price, date, userID) VALUES ('Kingsland, Arkansas', 'country blues feeling', 100, '2010-10-10', 3);
-- THIS WILL HAVE spaceID OF 2
INSERT INTO Spaces (name, description, price, date, userID) VALUES ('Locust Ridge, Tennessee', 'bluegrass lovin', 100, '2014-04-04', 4);
-- THIS WILL HAVE spaceID OF 3
INSERT INTO Spaces (name, description, price, date, userID) VALUES ('Detroit city view', 'classic soul', 100, '2013-01-02', 5);


-- THIS WILL HAVE availabilityID OF 1
INSERT INTO Availabilities (date, spaceID) VALUES ('2010-10-10', 1);
-- THIS WILL HAVE availabilityID OF 2
INSERT INTO Availabilities (date, spaceID) VALUES ('2014-04-04', 2);
-- THIS WILL HAVE availabilityID OF 3
INSERT INTO Availabilities (date, spaceID) VALUES ('2013-01-02', 3);


-- THIS WILL HAVE requestID OF 1
INSERT INTO Requests (date, spaceID, userID) VALUES ('2010-10-10', 1, 2);
-- THIS WILL HAVE requestID OF 2
INSERT INTO Requests (date, spaceID, userID) VALUES ('2014-04-04', 2, 2);
-- THIS WILL HAVE requestID OF 3
INSERT INTO Requests (date, spaceID, userID) VALUES ('2013-01-02', 3, 1);
