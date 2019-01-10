# Project Social Red

### VERSION
#### ruby   '2.3.0'
#### rails  '5.0.7.1'


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
  
  https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
  
  ```sh
    gem 'omniauth-facebook'
  ```

  * Add a new OmniAuth provider with APP_ID & APP_SECRET
  ```sh
    config/initializers/devise.rb
  ```

## Styles with Material Design Lite
  
  https://getmdl.io/

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

  https://getmdl.io/components/index.html#layout-section

  ```sh
    /app/views/layouts/application.html.erb
    /app/views/partials/_nav.haml
  ```
## Test

  ```sh
    group :development, :test do
      # It allows to create objects of the BD for tests
      gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
      # Test frameworks
      gem 'rspec-rails', '~> 3.8', '>= 3.8.1'
      # Specific help methods for Rails validations
      gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
    end
  ```
  Download and install by running:
  ```sh
    bundle install
  ```
  Initialize the spec/ directory (where specs will reside) with:
  ```sh
    rails generate rspec:install
  ```
  This adds the following files which are used for configuration:
  ```sh
    .rspec
    spec/spec_helper.rb
    spec/rails_helper.rb
  ```
  Use the **rspec** command to run your specs
  ```sh
    rails generate rspec:model User
  ```
  ```sh
    /spec/rails_helper.rb
    Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
    end
  ```

### Annotate
  Add a comment with the structure that the model/table has 
  ```sh
    gem 'annotate', '~> 2.7', '>= 2.7.4'
  ```

### Best in place
  It is a gem that allows to edit the fields without having to move from place.
  ```sh
    gem 'best_in_place', '~> 3.1', '>= 3.1.1'
  ```

### Paperclip
  To attach files
  ```sh
    gem 'paperclip', '~> 6.1'

    $ bundle
    $ rails g migration add_attachment_cover_and_avatar_to_users
  ```
  Modify migration
  ```sh
    class AddAttachmentCoverAndAvatarToUsers < ActiveRecord::Migration[5.0]
      def change
        add_attachment :users, :avatar
        add_attachment :users, :cover
      end
    end
  ```
  ```sh
    $ rails db:migrate
  ```
  ```sh
    class User < ApplicationRecord
      ...
      has_attached_file :avatar, 
                        styles: { medium: "300x300>", thumb: "100x100>" }, 
                        default_url: "/images/:style/missing_avatar.png"
      validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

      has_attached_file :cover, 
                        styles: { medium: "800x600>", thumb: "400x300>" }, 
                        default_url: "/images/:style/missing_cover.png"
      validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
      ...  
    end
  ```
