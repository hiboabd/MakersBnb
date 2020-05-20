\c makersbnb
CREATE TABLE Availabilities (availabilityID SERIAL PRIMARY KEY, date DATE, spaceID INTEGER REFERENCES Spaces(spaceID));
\c makersbnb_test 
CREATE TABLE Availabilities (availabilityID SERIAL PRIMARY KEY, date DATE, spaceID INTEGER REFERENCES Spaces(spaceID));
