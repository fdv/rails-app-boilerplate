Rails Application Boilerplate
=============================

[![Build Status](https://travis-ci.org/fdv/rails-app-boilerplate.png)](https://travis-ci.org/fdv/rails-app-boilerplate)
[![Dependency Status](https://gemnasium.com/fdv/rails-app-boilerplate.png)](https://gemnasium.com/fdv/rails-app-boilerplate)
[![Code Climate](https://codeclimate.com/github/fdv/rails-app-boilerplate.png)](https://codeclimate.com/github/fdv/rails-app-boilerplate)

Rails Application Boilerplate is a small, ready to code, Rails application. It was intended to avoid repeating the same process for every Rails project I start.

It provides:

* A configured Rails application 
* A Twitter Bootstrap fluid layout
* A full registration / authentication part
* A few helpers to be used everywhere in the application
* An application settings system
* Rspec, Webrat and Factory Girl for testing

The idea came while discussing with my colleague and friend [Yann Moisan](https://github.com/YannMoisan) about hackatons and how some people actually bootstraped their application befor the event so they won't have to spend 10+ minutes building what can be easily done before. That's how I realized that I did the same thing for every project I start, this leading to never finished projects.

# Application init

Fork or clone Rails App Boilerplate from Github:

    $ git clone git://github.com/fdv/rails-app-boilerplate.git

Copy config/database.yml.yourdatabase to config/database.yml and fill in your credential.

Then run:

    $ bundle install
    $ rake db:create
    $ rake db:migrate
    $ rake db:seed
    $ rake secret    #generate new secret token for your app
    $ ./scripts/rails server

Now, you can access your application in your Web browser at `127.0.0.1:3000`.

# Playing with application settings

`app.xxx`: calls the xxx application setting. Application params are stored in a serialized array so they can be added / removed without changing the data model.

Calling `<%= app.app_name_ %>` in the views displays the application name.

To add new settings, edit app/models/app.rb, and call the setting method:

```ruby
setting :some_setting,                  :string, 'Some value'
setting :numeric_setting,               :integer, 1
setting :boolean_setting,               :boolean, true
```

Settings type can be `string`, `integer`, `boolean`, `yaml` or `json`.

Then you can set / get your settings like database fields.

```ruby
app = App.default
app.foo = "bar"
app.save
```

Creates the `foo` param for the application.

`App.default` method loads the first and only App record from the database. App is created at application init.

# Available helpers

`page_header(title, tag='h1')`: displays a formated page title, using the `h1` tag by default.

```html
<div class="page-header">
  <h1>Some title here</h1>
</div>
```

`app.xxx` : calls the application setting xxx.
