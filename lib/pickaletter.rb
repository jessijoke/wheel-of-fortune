require_relative '../config/environment.rb'

module Pickaletter
    def pick_a_letter(arr, lettertype)
        prompt = TTY::Prompt.new
        input = nil
        while input == nil
            input = prompt.ask("Pick a #{lettertype}")
        end
        unless arr.include?(input)
            input = prompt.ask("Choose a #{lettertype} that has not already been selected") until arr.include?(input)
        end
        input = input.downcase.strip.to_s
        input
    end
end