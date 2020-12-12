require_relative '../config/environment.rb'
require 'pry'

module Display_Puzzle
    def display(quote, arr1, arr2)
        quote.gsub(/#{arr1}"&"#{arr2}/i, '-')
    end
end

