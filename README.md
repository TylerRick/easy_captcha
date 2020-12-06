# EasyCAPTCHA

[![Build Status](https://travis-ci.org/K-and-R/easy_captcha.svg?branch=master)](https://travis-ci.org/K-and-R/easy_captcha)
[![Maintainability](https://api.codeclimate.com/v1/badges/0505012081a472de86e2/maintainability)](https://codeclimate.com/github/K-and-R/easy_captcha/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/0505012081a472de86e2/test_coverage)](https://codeclimate.com/github/K-and-R/easy_captcha/test_coverage)

A simple captcha implementation for Rails 5+ based on RMagick.

This (`kandr-easy_captcha`) is a fork of
[EasyCaptcha](https://github.com/phatworx/easy_captcha) (`easy_captcha`) with Rails 5+ support. This fork is
maintained by Karl Wilbur/K&R Software (karl@kandrsoftware.com).

## Dependencies/Requirements

* Rails 5+ (<http://github.com/rails/rails>)
* RMagick

RMagick should be included in your `Gemfile`

```ruby
  gem 'rmagick'
```

for Java/JRuby you can use

```ruby
  gem 'rmagick4j'
```

## Installation

add to Gemfile

```ruby
  gem 'kandr-easy_captcha', require: 'easy_captcha'
```

after running `bundle install`, execute

```bash
  rails g easy_captcha:install
```

## Configuration

You can configure `easy_captcha` in `config/initializers/easy_captcha.rb`, if
you want to customize the default configuration

```ruby
  EasyCaptcha.setup do |config|
    # Cache
    # config.cache          = true
    # Cache temp dir from Rails.root
    # config.cache_temp_dir = Rails.root.join('tmp', 'captchas')
    # Cache size
    # config.cache_size     = 500
    # Cache expire
    # config.cache_expire   = 1.day

    # Chars
    # config.chars          = %w(2 3 4 5 6 7 9 A C D E F G H J K L M N P Q R S T U X Y Z)

    # Length
    # config.length         = 6

    # Image
    # config.image_height   = 40
    # config.image_width    = 140

    # eSpeak (default disabled)
    # config.espeak do |espeak|
      # Amplitude, 0 to 200
      # espeak.amplitude = 80..120

      # Word gap. Pause between words
      # espeak.gap = 80

      # Pitch adjustment, 0 to 99
      # espeak.pitch = 30..70

      # Use voice file of this name from espeak-data/voices
      # espeak.voice = nil
    # end

    # configure generator
    # config.generator :default do |generator|

      # Font
      # generator.font_size              = 24
      # generator.font_fill_color        = '#333333'
      # generator.font_stroke_color      = '#000000'
      # generator.font_stroke            = 0
      # generator.font                   = File.expand_path('../../resources/afont.ttf', __FILE__)


      # Background color
      # generator.image_background_color = "#FFFFFF"
      # Or background image (e.g. transparent png)
      # generator.background_image       = File.expand_path('../../resources/captcha_bg.png', __FILE__)

      # Wave
      # generator.wave                   = true
      # generator.wave_length            = (60..100)
      # generator.wave_amplitude         = (3..5)

      # Sketch
      # generator.sketch                 = true
      # generator.sketch_radius          = 3
      # generator.sketch_sigma           = 1

      # Implode
      # generator.implode                = 0.1

      # Blur
      # generator.blur                   = true
      # generator.blur_radius            = 1
      # generator.blur_sigma             = 2
    # end
  end
```

## Caching

It is strongly recommended to enable caching. You can see the three paramters which you have to fill in your config
file below.

```ruby
  EasyCaptcha.setup do |config|
    # Cache
    config.cache          = true
    # Cache temp dir from Rails.root
    config.cache_temp_dir = Rails.root.join('tmp', 'captchas')
    # Cache expire
    config.cache_expire   = 1.day
    # Cache size
    # config.cache_size     = 500
  end
```

## Example

```ruby
  <% form_tag '/' do %>
    <% if request.post? %>
      <p><%= valid_captcha?(params[:captcha]) ? 'valid' : 'invalid' %> captcha</p>
    <% end %>
    <p><%= captcha_tag %></p>
    <p><%= text_field_tag :captcha %></p>
    <p><%= submit_tag 'Validate' %></p>
  <% end %>
```

## Example app

You find an example app under: <http://github.com/phatworx/easy_captcha_example>

## History

See the [CHANGELOG.md](./CHANGELOG.md)

## Maintainers

* Karl Wilbur (<http://github.com/karlwilbur>)
* K&R Software (<http://github.com/K-and-R>)

## Contributing to (K&R) EasyCaptcha

* See the [TODO.md](./TODO.md) file for a list of needed changes
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it!
* Please do not edit `Rakefile`, `EasyCaptcha::VERSION`, or `CHANGELOG`

## Copyright

Copyright (c) 2010 Marco Scholl. See LICENSE.txt for further details.
