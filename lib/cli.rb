require_relative '../config/environment.rb'

class Game
    attr_accessor :newpuzzle, :quote, :consonants, :vowels, :score, :name
    attr_reader 
    include Spinthewheel
    include Banners
    include Display_Puzzle
    include Turn

    @@score = 0

    def initialize
        @newpuzzle = Newpuzzle.new
        @consonants = "[bcdfghjklmnpqrstvwxyz"
        @vowels = "aeiou]"
        GenreAPI.new.parse_json_categories
    end

    def play
        start
        @name = get_name
        generate_puzzle
        score_menu_turn
    end

    def update_board
        puzzle_board
        end_game if puzzle_solved?
        score_menu_turn
    end

    def get_name
        prompt = TTY::Prompt.new
        @name = prompt.ask("What's your name? (Type your name and press 'Enter/Return')", default: ENV["USER"])
    end

    def generate_puzzle
        #genres = Genre.all.map { |genre| genre.name }.join(", ")
        genres = Genre.all.map { |genre| genre.name }
        prompt = TTY::Prompt.new

        category_chosen = prompt.select("Which category would you like to play? (Use the the left and right arrow keys to view more categories)", genres, per_page: 7, cycle: true, default: 1)
        @quote = @newpuzzle.select_puzzle(category_chosen)
        puzzle_board
    end

    def turn_select
        input = gets
        if !input
            input = gets until !input
        end
        input = input.strip.downcase
        if input == "s" || input == "spin" || input == "spin the wheel"
            spin_the_wheel
        elsif input == "v" || input == "vowel" || input == "buy a vowel"
            buy_a_vowel
        elsif input == "sv" || input == "solve" || input == "solve the puzzle"
            solve_the_puzzle
        elsif input == @quote.strip.downcase
            end_game
        else
            turn_select
        end
    end

    def puzzle_board
        puts display_top
        if puzzle_solved?
            puts @quote
        else
            puts display(@quote, @consonants, @vowels)
        end
        puts display_bottom
    end

    def spin_the_wheel
        if @consonants == "["
            puts "You have already chosen all the. Buy a vowel or solve the puzzle."
            turn_select
        else
            wheelvalue = wheel[0]
            if wheelvalue != "Bankrupt"
                puts "You spun $#{wheelvalue}"
                letter = spin_the_wheel_turn(@consonants, @quote, "consonant") 
                if @quote.downcase.include?(letter) 
                    multiplier = @quote.downcase.count(letter)
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
                @@score = 0
                puts "You spun #{wheelvalue} ¯\_(ツ)_/¯"
                score_menu_turn
            end
        end
    end

    def buy_a_vowel
        if @vowels == "]"
            puts "You have already purchased all the vowels. Spin the wheel or solve the puzzle."
            turn_select
        else
            if @@score >= 5000
                @@score -= 5000
                letter = buy_a_vowel_turn(@vowels, "vowel")
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
        if solve_puzzle(input, @quote)
            end_game
        else
            puts "That was not correct"
            score_menu_turn
        end
    end

    def score_menu_turn
        score_board(@name, @@score)
        menu_banner
        turn_select
    end

    def self.score
        @@score
    end

    def puzzle_solved?
        display(@quote, @consonants, @vowels) == @quote
    end

    def end_game
        if @@score > 0
            win_image
            end_banner("Congratulations #{@name} You Won! Your final score is $#{@@score}")
        else
            lose_image
            end_banner("Well #{@name}, you solved the puzzle but I wouldn't exactly call this a win. Your final score is -$#{@@score}")
        end
        prompt = TTY::Prompt.new
        input = prompt.ask("Would you like to play again? (y/n)")
        if input.strip.downcase == "yes" || input.strip.downcase == "y"
            @@score = 0
            @consonants = "[bcdfghjklmnpqrstvwxyz"
            @vowels = "aeiou]"
            play
        else
            exit
        end
    end
end