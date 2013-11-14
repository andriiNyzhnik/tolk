# Tolk
Tolk is a Rails 4 engine designed to facilitate the translators doing the dirty work of translating your application to other languages.

## Installation & Setup

To install add the following to your Gemfile:

````ruby
  gem 'tolk', :github => 'andriiNyzhnik/tolk', :branch => 'master'
````

To setup just run:

````
  rake tolk:setup
````

and mount the engine in your routes.rb file

````
  mount Tolk::Engine => "/tolk"
````

## Usage

Tolk treats I18n.default_locale as the master source of strings to be translated. If you want the master source to be different from I18n.default_locale, you can override it by setting Tolk::Locale.primary_locale_name. Developers are expected to make all the changes to the master locale file ( en.yml by default ) and treat all the other locale.yml files as readonly files.

As tolk stores all the keys and translated strings in the database, you need to ask Tolk to update it's database from the primary yml file :

````
  rake tolk:sync
````

The above will fetch all the new keys from en.yml and put them in the database. Additionally, it'll also get rid of the deleted keys from the database and reflect updated translations - if any.

If you already have data in your non primary locale files, you will need to import those to Tolk as a one time thing (this is also ran with setup) :

````
  rake tolk:import
````

Upon visiting http://your_app.com/tolk - you will be presented with different options like creating new locale or providing translations for the existing locales. Once done with translating all the pending strings, you are can write back the new locales to filesystem :

````
  rake tolk:dump_all
````

This will generate yml files for all non primary locales and put them in #{Rails.root}/config/locales/ directory by default.