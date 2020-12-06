require_relative '../config/environment.rb'


class Newpuzzle
    attr_accessor :category_chosen

    def choose_category(genre)
        genres = genre.parse_json
        length = genres["genres"].count - 1
        prompt = TTY::Prompt.new
        @category_chosen = prompt.ask("Which category would you like to play?", default: genres["genres"][0..length])
    end

    def select_puzzle
        puzzle = QuoteAPI.new("https://quote-garden.herokuapp.com/api/v2/genres/" + @category_chosen + "?page=1&limit=1000")
        puzzle_parsed = puzzle.parse_json
        choice = puzzle_parsed["quotes"][rand(0..(puzzle_parsed["quotes"].count - 1))]
        final_choice = choice["quoteText"]
    end
end