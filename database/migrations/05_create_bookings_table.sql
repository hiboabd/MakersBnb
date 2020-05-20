\c makersbnb
CREATE TABLE Bookings (bookingID SERIAL PRIMARY KEY, date DATE, spaceID INTEGER REFERENCES Spaces(spaceID), userID INTEGER REFERENCES Users(userID));
\c makersbnb_test 
CREATE TABLE Bookings (bookingID SERIAL PRIMARY KEY, date DATE, spaceID INTEGER REFERENCES Spaces(spaceID), userID INTEGER REFERENCES Users(userID));