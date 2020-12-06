require_relative '../config/environment.rb'

class Spinthewheel
    attr_accessor :wheelvalues

    def initialize
        @wheelvalues = [800, 500, 650, 500, 900, "Bankrupt", 5000, 500, 900, 700, 600, 800, 500, 700, 500, 600, 550, 500, 900, "Bankrupt", 650, 900, 700, 2500]
    end

    def wheel
        @wheelvalues.sample(1)
        puts "Your spin is worth $#{@spinthewheel.wheel(@wheelvalues)}"
    end

    def pick_a_letter(letters)
        prompt = TTY::Prompt.new
        input = prompt.ask("Pick a consonant").downcase.strip.to_s
        puts input
        unless letters.include?(input)
           input = prompt.ask("Choose a consonant that has not already been selected").downcase.strip.to_s until letters.include?(@input)
        end
        input

        # binding.pry
        # while !letters.include?(input)
        #     input = prompt.ask("Choose a consonant that has not already been selected").downcase.strip.to_s 
        # end
        #@input = prompt.ask("Pick a consonant").downcase.to_s
        #@input = @input
    end

end

#binding.pry