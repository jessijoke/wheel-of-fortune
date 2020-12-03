require_relative '../config/environment.rb'
require 'pry'

class Wheeloffortune
    attr_accessor :banners

    def initialize(genres=QuoteAPI.new)
        @genres = genres
    end

    def play
        Banners.wheel_of_fortune_title
    end
end
