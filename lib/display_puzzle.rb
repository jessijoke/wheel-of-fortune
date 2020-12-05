require_relative '../config/environment.rb'
require 'pry'

class Display_Puzzle
    def display(quote, arr)
        quote.gsub(/#{arr}/i, '-')
    end
end

