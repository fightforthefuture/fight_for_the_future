# Fight for the Future

Utilities to supplement the cause of [Fight for the Future][fight].

[fight]: http://fightforthefuture.org/

## Installation

    gem install fight_for_the_future

## Requiring the gem

    require 'fight_for_the_future'

## Using Bundler

    gem 'fight_for_the_future'

## Example

    original_image_path = File.expand_path('../original.png', __FILE__)
    censored_image_path = File.expand_path('../censored.png', __FILE__)
    url = 'http://censr.net/23985'

    censored_image = FightForTheFuture::ImageCensor.new(original_path, url)
    censored_image.write(censored_path)

## License

Fight for the Future is Copyright © 2011 Fight for the Future.
