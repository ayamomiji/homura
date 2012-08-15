# Homura

Homura is a simple layout generator and helpers for rails.

## Installation

Add this line to your application's Gemfile:

    gem 'homura'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install homura

## Usage

### Base Layout

Run this to generate a base layout:

    $ rails generate homura:install

### Layout Helpers

Providing these helpers:

    page_title
    page_description
    canonical_link
    og_properties

### Locale Detection

In application controller:

    include Homura::SetLocale

Your app will set locale via params/cookies/http-accept-language before any
requests.

### Mobile Detection

In application controller:

    include Homura::MobileDetection

Then put your mobile views in `app/mobile_views`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
