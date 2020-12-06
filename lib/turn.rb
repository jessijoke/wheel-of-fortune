require_relative '../config/environment.rb'

class Turn
    attr_accessor :spinwheel

    def initialize
        @spinwheel = Spinthewheel.new
    end

    def spin_the_wheel(letters, quote)
        #@spinwheel.wheel
        @spinwheel.pick_a_letter(letters)
    end

    def buy_a_vowel
        
    end
end