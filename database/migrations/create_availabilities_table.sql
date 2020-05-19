CREATE TABLE Availabilities (availabilityID SERIAL PRIMARY KEY, date DATE, FOREIGN KEY (spaceID) REFERENCES Spaces(spaceID));
