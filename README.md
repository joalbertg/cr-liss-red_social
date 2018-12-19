# README

# dotenv
To load .env environment variables into developing ENV.
Environment variables that can be called in the configuration files.

## Installation and usage

### [](https://github.com/bkeepers/dotenv#rails)Rails

**1.-** Add this line to the top of your application's Gemfile:

  gem 'dotenv-rails', groups: [:development, :test]

**2.-** And then execute:

  $ bundle

**3.-** Create an **.env** file in the root of the application.

**4.-** Within the **.env** file we add what we need to be the environment variables.

  Example:
    DATABASE=db_name
    DB_USERNAME=db_username
    DB_PASSWORD=db_password

**5.-** These variables are going to be used in the **database.yml** file

  Example:
    database: <%= ENV['DATABASE'] %>
    username: <%= ENV['DB_USERNAME'] %>
    password: <%= ENV['DB_PASSWORD'] %>

**6.-** Start the server ($ rails s) and it will work without having to modify the files with information that could compromise.

**7.-** Add the **.env** file in the ***.gitignore*** file

**Note:**
  This project uses environment variables in the following files:

  config/database.yml
  config/environments/development.rb
