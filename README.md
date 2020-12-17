# Wheeloffortune

![Wheel of Fortune Logo](./images/banner.jpg)

Welcome to Wheel of Fortune! This is a single player command line version of the game show we all know and love, after installation type `ruby bin/wheeloffortune` to run.

## Installation

Add this line to your application's Gemfile:

Imagemagick is required to run this CLI app

Follow the instructions here
https://imagemagick.org/script/download.php

-----------------------------------------------
OR
-----------------------------------------------

```
brew install imagemagick
```

To correct a dependency glitch in the Catpix & Rmagick gems, you'll also need to run these commands to relink imagemagick6
```
brew unlink imagemagick
brew install imagemagick@6 && brew link imagemagick@6 --force
```

-----------------------------------------------


And then execute:

    $ bundle install

<!--
--------------------------------------------------
Only applicable when this is uploaded to ruby gems
--------------------------------------------------

```ruby
gem 'wheeloffortune'
```

Or install it yourself as:

    $ gem install wheeloffortune

--------------------------------------------------
-->

## Usage

Wheel of Fortune is a command line game that utilizes the Quote-Garden API to pull puzzles. When you start the application, enter your name, then select one of Quote Garden's categories. The application will then randomly select one of the quote's from that category and generate a puzzle. You can Spin the Wheel, Buy a Vowel, or Solve the Puzzle. 

Spinning the wheel will generate a value your guess is worth. You will win the value * the number of times that letter is in the puzzle. (So if your spin value is 200, and the letter was in the puzzle 5 times, you win 1000)

Buying a vowel costs 5000. This is not multipled by the times the letter is in the puzzle.

To solve the puzzle you must type the puzzle (punctuation included) letter for letter. There is no penalty for guessing incorrectly.

If you get all the letters on the board through spinning the wheel and buying vowels, the game will end.

When the game ends you it will determine whether you won or lost based on whether your score is negative or positive, and then give you the option to play again or quit.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wheeloffortune. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/wheeloffortune/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wheeloffortune project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wheeloffortune/blob/master/CODE_OF_CONDUCT.md).
