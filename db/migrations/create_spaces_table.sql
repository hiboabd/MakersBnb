CREATE TABLE Spaces (spaceID SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(280), price INT, date DATE, FOREIGN KEY (userID) REFERENCES Users(userID));
