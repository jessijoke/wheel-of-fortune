require_relative '../config/environment.rb'

class Game
    attr_accessor :banners, :newpuzzle, :quote, :displaypuzzle, :alphabet, :score, :wheel, :name

    def initialize
        @banners = Banners.new
        @newpuzzle = Newpuzzle.new
        @displaypuzzle = Display_Puzzle.new
        @alphabet = "[abcdefghijklmnopqrstuvwxyz]"
        @score = 0
        @wheel = [800, 500, 650, 500, 900, "Bankrupt", 5000, 500, 900, 700, 600, 800, 500, 700, 500, 600, 550, 500, 900, "Bankrupt", 650, 900, 700, 2500]
    end

    def play
        @banners.title
        @banners.blank_link
        @banners.welcome 
        @name = get_name
        @newpuzzle.choose_category(QuoteAPI.new("https://quote-garden.herokuapp.com/api/v2/genres"))
        @quote = @newpuzzle.select_puzzle
        puzzle_board
        menu
    end

    def get_name
        prompt = TTY::Prompt.new
        @name = prompt.ask("What's your name? (Type your name and press 'Enter/Return')", default: ENV["USER"])
    end

    def menu
        @banners.menu
    end

    def puzzle_board
        puts @banners.blank_link
        puts @banners.game_board_border
        puts @banners.blank_link
        puts @displaypuzzle.display(@quote, @alphabet)
        puts @banners.blank_link
        puts @banners.game_board_border
    end
end

