require_relative '../config/environment.rb'
require 'pry'
require "tty-prompt"

class Game
    attr_accessor :banners, :newpuzzle, :quote, :displaypuzzle, :alphabet, :name

    def initialize
        @banners = Banners.new
        @newpuzzle = Newpuzzle.new
        @displaypuzzle = Display_Puzzle.new
        @alphabet = "[abcdefghijklmnopqrstuvwxyz]"
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
        puts "Choose an option:"
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

