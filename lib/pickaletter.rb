require_relative '../config/environment.rb'

module Pickaletter
    def pick_a_letter(arr, lettertype)
        prompt = TTY::Prompt.new
        input = prompt.ask("Pick a #{lettertype}").downcase.strip.to_s
        unless arr.include?(input)
            input = prompt.ask("Choose a #{lettertype} that has not already been selected").downcase.strip.to_s until arr.include?(input)
        end
        input
    end
end