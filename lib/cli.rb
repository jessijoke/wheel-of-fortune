require_relative '../config/environment.rb'
require 'pry'
require "tty-prompt"
require "tty-table"

class Game
    attr_accessor :banners, :genres, :categories, :name, :category_chosen

    def initialize
        #binding.pry
        @genres = QuoteAPI.new("https://quote-garden.herokuapp.com/api/v2/genres")
        @banners = Banners.new
    end

    def play
        #@banners.title
        puts "Welcome to Wheel of Fortune!"
        @name = get_name
        choose_category
    end

    def get_name
        prompt = TTY::Prompt.new
        @name = prompt.ask("What's your name? (Type your name and press 'Enter/Return')", default: ENV["USER"])
        puts @name
    end

    def parse_category
        #binding.pry
        @categories = @genres.parse_json 
        # @categories["genres"].each.with_index(1) { |genre, index| 
        #     rows[0] << genre if index > 22
        #     rows[1] << genre if index <= 22 && index > 42
        #     rows[2] << genre if index <= 42 && index > 63
        #     rows[3] << genre if index <= 63 && index > 84
        #     rows[4] << genre if index <= 84 && index > 105
        # }
    end

    def choose_category
        parse_category
        length = @categories["genres"].count - 1
        prompt = TTY::Prompt.new
        @category_chosen = prompt.ask("Which category would you like to play?", default: @categories["genres"][0..length])
        puts @category_chosen
        #puts rows
        #rows  = [['a1', 'a2'], ['b1', 'b2']]
        #table = Table.new header: ['Header 1', 'Header 2'], rows: rows
        #table = Table.new ['Header 1', 'Header 2'], rows
        #puts table.render(:basic)
    end
end

