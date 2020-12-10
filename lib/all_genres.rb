require_relative '../config/environment.rb'

class All_genres
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