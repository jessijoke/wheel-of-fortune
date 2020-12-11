require_relative '../config/environment.rb'

class Genre
    attr_reader :name, :all
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
end