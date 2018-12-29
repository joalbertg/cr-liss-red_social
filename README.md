# README

# dotenv
  To load .env environment variables into developing ENV.
  
  Environment variables that can be called in the configuration files.

## Installation and usage

### [](https://github.com/bkeepers/dotenv#rails)Rails

  **1.-** Add this line to the top of your application's Gemfile:
  ```sh
    gem 'dotenv-rails', groups: [:development, :test]
  ```
  **2.-** And then execute:
  ```sh
    $ bundle
  ```
  **3.-** Create an **.env** file in the root of the application.

  **4.-** Within the **.env** file we add what we need to be the environment variables.
  ```sh
    Example:
      DATABASE=db_name
      DB_USERNAME=db_username
      DB_PASSWORD=db_password
  ```
  **5.-** These variables are going to be used in the **database.yml** file
  ```sh
    Example:
      database: <%= ENV['DATABASE'] %>
      username: <%= ENV['DB_USERNAME'] %>
      password: <%= ENV['DB_PASSWORD'] %>
  ```

  **6.-** Start the server ($ rails s) and it will work without having to modify the files with information that could compromise.

  **7.-** Add the **.env** file in the ***.gitignore*** file


  **NOTE:**
    This project uses environment variables in the following files:
  ```sh
    config/database.yml
    config/environments/development.rb
  ```

## Authentication with Facebook
  
  *[https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview]
  
  ```sh
    gem 'omniauth-facebook'
  ```

  * Add a new OmniAuth provider with APP_ID & APP_SECRET
  ```sh
    config/initializers/devise.rb
  ```

## Styles with Material Design Lite
  
  *[https://getmdl.io/]

  ```sh
    /app/views/layouts/application.html.erb
  ```

## Colors with SCSS

  ```sh
    /app/assets/stylesheets/colors.scss
  ```

## Configuration of strong params for the user
  ```sh
    /app/controllers/users/omniauth_callbacks_controller.rb
  ```

## Configuring routes for authenticated and unauthenticated users
 ```sh
    /config/routes.rb
  ```

## Navigation with Material Design Lite

  *[https://getmdl.io/components/index.html#layout-section]

  ```sh
    /app/views/layouts/application.html.erb
    /app/views/partials/_nav.haml
  ```
