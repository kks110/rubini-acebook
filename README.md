# Rubini Acebook

We are Rubini!

![rubini](app/assets/images/blah.png)



Follow our team's progress for this project on our blog at:
https://medium.com/@teamrubini

Visit the functioning website at:
https://rubini-acebook.herokuapp.com/


## Description
Acebook is a free web application that  allows you to register using your email and a password(that is encrypted when stored in the database). Members can add posts with text, edit and update these posts, view all other members' posts on the news feed and like and unlike any posts.


## Installation

To rub Acebook on your local machine - download Ruby version 2.6.0 and install the gems.

```bash
brew install ruby-install
ruby-install ruby 2.6
bundle install
```

## Usage
Run the migration files to ensure you have the databases and launch the server.
```bash
rails db:migrate
rails server
```

## Run the tests
Run the unit
```bash
rails test
rails test:system
```

## You're good to go!
