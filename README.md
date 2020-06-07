# Makersbnb

## Preview
<img width="320" alt="makersbnb-welcome" src="https://user-images.githubusercontent.com/28805811/83120379-e3902700-a0c8-11ea-86a9-c15d959142f8.png">

<img width="320" alt="MakersBnB-signup" src="https://user-images.githubusercontent.com/28805811/83120467-04587c80-a0c9-11ea-9768-45350996c04e.png">

## Instructions

* Clone repository
* Run `bundle install`

## Database setup

### Database and Tables:

```
psql < database/migrations/01_create_database.sql  
psql < database/migrations/02_create_users_table.sql  
psql < database/migrations/03_create_spaces_table.sql  
psql < database/migrations/04_create_requests_table.sql  
psql < database/migrations/05_create_bookings_table.sql  
psql < database/migrations/06_create_availabilities_table.sql
```

TODO: Create migrate script that combines everything into a single script

### Database User:

```
psql
CREATE USER postgres;
ALTER ROLE postgres WITH SUPERUSER;
```

TODO: Create script for above and add to everything script

## Testing

To run Feature and Unit tests run script:  
`./test/tdd.test`

This will run Rspec, with SimpleCov, followed by RuboCop.

To test in browser, run script:  
`./test/web.test`

This will open Chrome in incognito mode and load http://localhost:9292, probably before the server is running, so need to refresh to see page.

## User Stories

Any signed-up user can list a new space.
```
As a user
So i can use makersbnb
I would like to register for an account
```
```
As a registered user
So i can let people know i have a space to rent
I would like to list a new space
```

Users can list multiple spaces.
```
As a registered user
So i can let people know i have a multiple space to rent
I would like to list more than one space
```

Users should be able to name their space, provide a short description of the space, and a price per night.
```
As a registered user
So i can advertise my space
I would like to specify a name, description and price for my space
```

Users should be able to offer a range of dates where their space is available.

```
As a registered user
So i can advertise my space
I would like the specify the time the space is available for
```

Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.

```
As a registered user
So that i can make a booking
I would like to request to hire a space for one night
```
```
As a registered user
So that i can confirm a booking
I would like to approve a users request to rent my space for one night
```

Nights for which a space has already been booked should not be available for users to book that space.
```
As a registered user
So that i don’t double book
I would like to see that a space is unavailable
```

Until a user has confirmed a booking request, that space can still be booked for that night.
```
As a registered user
Until i have confirmed the booking
I would like other users to be able to book my space
```
