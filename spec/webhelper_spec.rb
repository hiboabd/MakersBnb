require 'pg'

USER_ID = 1
FIRST_NAME = 'John'
LAST_NAME = 'Doe'
EMAIL = 'john.doe@example.com'
PASSWORD = '$2a$12$Z3YyX5M1wOPn31Pfq8dA..o4x6oo3eC0ZV4l8PWeBU4t6/Q9gvPJS'
SPACE_ID = 1

NAME = 'Home'
DESCRIPTION = 'No place like home'
PRICE = 50
DATE_1 = '2001/01/01'
DATE_2 = '2001/01/02'
DATE_3 = '2001/01/03'

REQUEST_ID = 1
BOOKING_ID = 1
AVAILABILITIY_ID = 1

OWNER_ID = 2
OWNER_F_NAME = 'Dolly'
OWNER_L_NAME = 'Parton'
OWNER_EMAIL = 'DPartone@example.com'
OWNER_PASSWORD = '9to5'

def empty_tables
  con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres', :password => 'Pg5429671'
  rs = con.exec "TRUNCATE TABLE Users RESTART IDENTITY CASCADE;"
  rs = con.exec "TRUNCATE TABLE Spaces RESTART IDENTITY CASCADE;"
  rs = con.exec "TRUNCATE TABLE Availabilities RESTART IDENTITY CASCADE;"
  rs = con.exec "TRUNCATE TABLE Requests RESTART IDENTITY CASCADE;"
  rs = con.exec "TRUNCATE TABLE Bookings RESTART IDENTITY CASCADE;"
end

def fill_tables
  con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres', password: 'Pg5429671'
  rs = con.exec "INSERT INTO Users (first_name, last_name, email, password) VALUES ('#{FIRST_NAME}', '#{LAST_NAME}', '#{EMAIL}', '#{PASSWORD}');"
  rs = con.exec "INSERT INTO Spaces (name, description, price, date, userID) VALUES ('#{NAME}', '#{DESCRIPTION}', '#{PRICE}', '#{DATE_1}', '#{USER_ID}');"
  rs = con.exec "INSERT INTO Requests (date, spaceID, userID) VALUES ('#{DATE_1}', '#{SPACE_ID}', '#{USER_ID}');"
  rs = con.exec "INSERT INTO Bookings (date, spaceID, userID) VALUES ('#{DATE_1}', '#{SPACE_ID}', '#{USER_ID}');"
  rs = con.exec "INSERT INTO Availabilities (date, spaceID) VALUES ('#{DATE_1}', '#{SPACE_ID}');"
end

def fill_request_table_with_1_request
  con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres', :password => 'Pg5429671'
  rs = con.exec "INSERT INTO Users (first_name, last_name, email, password) VALUES ('#{FIRST_NAME}', '#{LAST_NAME}', '#{EMAIL}', '#{PASSWORD}');"
  rs = con.exec "INSERT INTO Users (first_name, last_name, email, password) VALUES ('#{OWNER_F_NAME}', '#{OWNER_L_NAME}', '#{OWNER_EMAIL}', '#{OWNER_PASSWORD}');"
  rs = con.exec "INSERT INTO Spaces (name, description, price, date, userID) VALUES ('#{NAME}', '#{DESCRIPTION}', '#{PRICE}', '#{DATE_1}', '#{OWNER_ID}');"
  rs = con.exec "INSERT INTO Availabilities (date, spaceID) VALUES ('#{DATE_1}', '#{SPACE_ID}');"
  rs = con.exec "INSERT INTO Requests (date, userID, spaceID) VALUES ('#{DATE_1}', '#{USER_ID}', '#{SPACE_ID}');"
end

def fill_bookings_table_with_3_bookings
  con = PG.connect :dbname => 'makersbnb_test', :user => 'postgres', :password => 'Pg5429671'
  rs = con.exec "INSERT INTO Users (first_name, last_name, email, password) VALUES ('#{FIRST_NAME}', '#{LAST_NAME}', '#{EMAIL}', '#{PASSWORD}');"
  rs = con.exec "INSERT INTO Users (first_name, last_name, email, password) VALUES ('#{OWNER_F_NAME}', '#{OWNER_L_NAME}', '#{OWNER_EMAIL}', '#{OWNER_PASSWORD}');"

  rs = con.exec "INSERT INTO Spaces (name, description, price, date, userID) VALUES ('#{NAME}', '#{DESCRIPTION}', '#{PRICE}', '#{DATE_1}', '#{OWNER_ID}');"
  rs = con.exec "INSERT INTO Spaces (name, description, price, date, userID) VALUES ('#{NAME}', '#{DESCRIPTION}', '#{PRICE}', '#{DATE_2}', '#{USER_ID}');"
  rs = con.exec "INSERT INTO Spaces (name, description, price, date, userID) VALUES ('#{NAME}', '#{DESCRIPTION}', '#{PRICE}', '#{DATE_3}', '#{USER_ID}');"

  rs = con.exec "INSERT INTO Availabilities (date, spaceID) VALUES ('#{DATE_1}', '#{SPACE_ID}');"
  rs = con.exec "INSERT INTO Availabilities (date, spaceID) VALUES ('#{DATE_2}', '#{SPACE_ID}');"
  rs = con.exec "INSERT INTO Availabilities (date, spaceID) VALUES ('#{DATE_3}', '#{SPACE_ID}');"

  rs = con.exec "INSERT INTO Requests (date, spaceID, userID) VALUES ('#{DATE_1}', '#{SPACE_ID}', '#{USER_ID}');"
  rs = con.exec "INSERT INTO Requests (date, spaceID, userID) VALUES ('#{DATE_2}', '#{SPACE_ID}', '#{USER_ID}');"
  rs = con.exec "INSERT INTO Requests (date, spaceID, userID) VALUES ('#{DATE_3}', '#{SPACE_ID}', '#{USER_ID}');"

  rs = con.exec "INSERT INTO Bookings (date, spaceID, userID) VALUES ('#{DATE_1}', '#{SPACE_ID}', '#{USER_ID}');"
  rs = con.exec "INSERT INTO Bookings (date, spaceID, userID) VALUES ('#{DATE_2}', '#{SPACE_ID}', '#{USER_ID}');"
  rs = con.exec "INSERT INTO Bookings (date, spaceID, userID) VALUES ('#{DATE_3}', '#{SPACE_ID}', '#{USER_ID}');"
end
