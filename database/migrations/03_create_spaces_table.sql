\c makersbnb
CREATE TABLE Spaces (spaceID SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(280), price INT, date DATE, userID INTEGER REFERENCES Users(userID));
\c makersbnb_test 
CREATE TABLE Spaces (spaceID SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(280), price INT, date DATE, userID INTEGER REFERENCES Users(userID));