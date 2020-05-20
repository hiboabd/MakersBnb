\c makersbnb
CREATE TABLE Requests (requestID SERIAL PRIMARY KEY, date DATE, spaceID INTEGER REFERENCES Spaces(spaceID), userID INTEGER REFERENCES Users(userID));
\c makersbnb_test 
CREATE TABLE Requests (requestID SERIAL PRIMARY KEY, date DATE, spaceID INTEGER REFERENCES Spaces(spaceID), userID INTEGER REFERENCES Users(userID));