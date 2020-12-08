require_relative '../config/environment.rb'

module Turn
    attr_accessor :spinwheel

    include Pickaletter

    def spin_the_wheel_turn(letters, quote, consonant)
        pick_a_letter(letters, consonant)
    end

    def buy_a_vowel_turn(letters, vowel)
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