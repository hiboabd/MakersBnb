# Makersbnb

## Preview
<img width="320" alt="makersbnb-welcome" src="https://user-images.githubusercontent.com/28805811/83120379-e3902700-a0c8-11ea-86a9-c15d959142f8.png">

<img width="320" alt="MakersBnB-signup" src="https://user-images.githubusercontent.com/28805811/83120467-04587c80-a0c9-11ea-9768-45350996c04e.png">

## Description
This is a simplified clone of Airbnb built as part of the Makers Academy week 6 group project week.

### Features

- Users can sign up to MakersBnB
- Users can log in
- Users can view spaces available with descriptions and price information
- If logged in, users can list their own space(s)
- Users can view the availability of a space

#### Functionality to add

Unfortunately, due to time constraints, the following features could not be implemented fully:

- Users can book a space
- Users can view booking requests for their spaces
- Users can approve/decline booking requests for their spaces
- Users can edit/delete their spaces

## Tech Stack
- [Sinatra](http://sinatrarb.com) a web framework for apps written in Ruby.
- [Ruby](https://www.ruby-lang.org/en/) our programming language.
- [PostgreSQL](https://www.postgresql.org) an open source relational database.
- [PG](https://rubygems.org/gems/pg/versions/0.18.4) a Ruby interface for the PostgreSQL relational database mapping system.
- [Rack](https://github.com/rack/rack) a modular Ruby webserver interface.
- [Rake](https://github.com/ruby/rake) a centralised task runner.
- [Handlebars](https://handlebarsjs.com/) to render view templates.
- [Rspec](https://github.com/rspec/rspec) for testing.
- [Capybara](https://github.com/teamcapybara/capybara) for end-to-end testing.
- [Bcrypt](https://www.npmjs.com/package/bcrypt) for password encryption.
- [Rubocop](https://github.com/rubocop-hq/rubocop) for linting.

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

## Planning

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

## Database structuring

User table
| ID | First name | Last name  | Email | Password |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |

Space table
| ID | User id (foreign key) | Name  | Description | Price |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| Content Cell  | Content Cell  | Content Cell  | Content Cell  | Content Cell  |

Availability table
| ID | Space id (foreign key) | Date  |
| ------------- | ------------- | ------------- |
| Content Cell  | Content Cell  | Content Cell  |

Requests table
| ID | User id (foreign key) | Space id (foreign key)  |
| ------------- | ------------- | ------------- |
| Content Cell  | Content Cell  | Content Cell  |

Bookings table
| ID | User id (foreign key)| Space id (foreign key) | Date |
| ------------- | ------------- | ------------- | ------------- |
| Content Cell  | Content Cell  | Content Cell  | Content Cell  |


## Class Responsibility Collaborator cards

| Class  | Responsibility | Collaborators |
| ------------- | ------------- | ------------- |
| Users  | Sign_up(f_name, l_name, email, password)  | Space |
|   | Log_in(email, password)  |Booking |
|   | owner_add_space(space) |  |
|  | user_request_booking(space, date)  |  |
|   | owner_confirm_booking()  |   |
|  | owner_deny_booking()  |   |

| Class  | Responsibility | Collaborators |
| ------------- | ------------- | ------------- |
| Spaces  | Initialize: name, description, price, date  | |
|  | add_space(name, description, price, date, userID)  |  |

| Class  | Responsibility | Collaborators |
| ------------- | ------------- | ------------- |
| Availability  | owner_add(space, date) |   |
|  | available?(date)  |   |


| Class  | Responsibility | Collaborators |
| ------------- | ------------- | ------------- |
| Requests  | all |   |
|   | add(date, space, user)  |  |
| | delete(request)  |   |
|  | user_request(date, space, user) - adds entry to requests table (duplicated by add, public vs private method?)  |   |
|   | owner_view_requests(space) - returns all requests for space - can use all, but filter by space_id?  |  |

| Class  | Responsibility | Collaborators |
| ------------- | ------------- | ------------- |
| Bookings | Initialize:   | Space |
|  | bookable?(date, space) - if no entry, returns available true  | User |
|  |all - returns all booking  |  |
|   | add(date, space, user)  | |
|  | owner_confirm_booking(date, space, user) - adds entry to bookings table and deletes requests | |
