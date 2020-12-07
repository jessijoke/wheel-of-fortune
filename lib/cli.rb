require_relative '../config/environment.rb'

class Game
    attr_accessor :banners, :newpuzzle, :quote, :displaypuzzle, :consonants, :vowels, :score, :wheelvalues, :spinthewheel, :name
    include Spinthewheel

    @@score = 0

    def initialize
        @banners = Banners.new
        @newpuzzle = Newpuzzle.new
        @displaypuzzle = Display_Puzzle.new
        @consonants = "[bcdfghjklmnpqrstvwxyz"
        @vowels = "aeiou]"
        #@spinthewheel = Spinthewheel.new
        @user_turn = Turn.new
    end

    def play
        #@banners.start
        @name = get_name
        generate_puzzle
        puts @banners.score_board(@name, @@score)
        puts @quote
        menu
        turn_select
    end

    def update_board
        puzzle_board
        puts @banners.score_board(@name, @@score)
        menu 
        turn_select
    end

    def get_name
        prompt = TTY::Prompt.new
        @name = prompt.ask("What's your name? (Type your name and press 'Enter/Return')", default: ENV["USER"])
    end

    def generate_puzzle
        @newpuzzle.choose_category(QuoteAPI.new("https://quote-garden.herokuapp.com/api/v2/genres"))
        @quote = @newpuzzle.select_puzzle
        puzzle_board
    end

    def menu
        @banners.menu
    end

    def turn_select
        input = gets.strip.downcase
        if input == "s" || input == "spin" || input == "spin the wheel"
            spin_the_wheel
        elsif input == "v" || input == "vowel" || input == "buy a vowel"
            buy_a_vowel
        elsif input == "sv" || input == "solve" || input == "solve the puzzle"
            solve_the_puzzle
        else
            turn_select
        end
    end

    def puzzle_board
        puts @banners.display_top
        puts @displaypuzzle.display(@quote, @consonants, @vowels)
        puts @banners.display_bottom
    end

    def spin_the_wheel
        wheelvalue = wheel[0]
        if wheelvalue != "Bankrupt"
            letter = @user_turn.spin_the_wheel(@consonants, @quote, "consonant") 
            puts "You spun $#{wheelvalue}"
            if @quote.include?(letter) 
                multiplier = @quote.count(letter)
                addvalue = wheelvalue*multiplier
                @@score += addvalue
                @consonants.tr!(letter, '')
                update_board
            else
                @@score -= (wheelvalue)
                @consonants.tr!(letter, '')
                update_board
            end
        else
            @@score == 0
            puts "You spun $#{wheelvalue}"
            menu
            turn_select
        end
    end

    def buy_a_vowel
        if @vowels == "]"
            puts "You have already purchased all the vowels. Spin the wheel or solve the puzzle."
            turn_select
        else
            if @@score > 5000
                @@score -= 5000
                letter = @user_turn.buy_a_vowel(@vowels, "vowel")
                if @quote.include?(letter) 
                    @vowels.tr!(letter, '')
                    update_board
                else
                    @vowels.tr!(letter, '')
                    update_board
                end
            else
                puts "Vowels cost $5000, try spinning the wheel"
                turn_select
            end
        end
    end

    def solve_the_puzzle
        prompt = TTY::Prompt.new
        input = prompt.ask("Solve the puzzle (must include punctuation in answer)")
        if @user_turn.solve_puzzle(input, @quote)
            puts "you won"
        else
            puts "That was not correct"
            menu
            turn_select
        end
    end

    def user_score

    end

    def self.score
        @@score
    end
end

