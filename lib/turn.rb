require_relative '../config/environment.rb'

class Turn
    attr_accessor :spinwheel

    include Pickaletter

    def spin_the_wheel(letters, quote, consonant)
        pick_a_letter(letters, consonant)
    end

    def buy_a_vowel(letters, vowel)
        pick_a_letter(letters, vowel)
    end

    def solve_puzzle(input, answer)
        if input.downcase == answer.downcase
            true
        else
            false
        end
    end
end