require_relative '../config/environment.rb'

class Game
    attr_accessor :banners, :newpuzzle, :quote, :displaypuzzle, :consonants, :vowels, :score, :wheelvalues, :spinthewheel, :name

    def initialize
        @banners = Banners.new
        @newpuzzle = Newpuzzle.new
        @displaypuzzle = Display_Puzzle.new
        @consonants = "[bcdfghjklmnpqrstvwxyz"
        @vowels = "aeiou]"
        @score = 0
        #@spinthewheel = Spinthewheel.new
        @user_turn = Turn.new
    end

    def play
        #@banners.start
        @name = get_name
        generate_puzzle
        menu
        turn_select
    end

    def update_board
        puts @consonants
        puzzle_board
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
        end
    end

    def puzzle_board
        puts @banners.display_top
        puts @displaypuzzle.display(@quote, @consonants, @vowels)
        puts @banners.display_bottom
    end

    def spin_the_wheel
        puts @user_turn.spin_the_wheel(@consonants, @quote)
        letter = @user_turn.spin_the_wheel(@consonants, @quote)
        if @quote.include?(letter) 
            @consonants.tr!(letter, '')
            update_board
        else
            @consonants.tr!(letter, '')
            update_board
        end
    end

    def buy_a_vowel

    end

    def solve_the_puzzle

    end

    def user_score

    end
end

