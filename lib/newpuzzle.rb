require_relative '../config/environment.rb'


class Newpuzzle
    attr_accessor :category_chosen, :all_genres

    def choose_category(genre)
        genres = genre.parse_json
        length = genres["genres"].count - 1
        prompt = TTY::Prompt.new
        @all_genres = genres["genres"]
        genre_objects
        temp = []
        genres["genres"].each { |el| temp << el.capitalize + "," }
        categories = temp.join(" ")
        @category_chosen = prompt.ask("Which category would you like to play?", default: categories)
    end

    def genre_objects
        @all_genres.each { |genre| All_genres.new(genre) }
    end

    def select_puzzle
        puzzle = QuoteAPI.new("https://quote-garden.herokuapp.com/api/v2/genres/" + @category_chosen + "?page=1&limit=1000")
        puzzle_parsed = puzzle.parse_json
        choice = puzzle_parsed["quotes"][rand(0..(puzzle_parsed["quotes"].count - 1))]
        final_choice = choice["quoteText"]
    end
end

#prompt.select("Choose your letter?", all_genres, per_page: 4)
#prompt.select("Choose your letter?") do |menu|
#    menu.per_page 8
#    menu.help "(Wiggle thy finger up/down and left/right to see more)"
#    menu.choices categories
#end
#@category_chosen = prompt.ask("Which category would you like to play?", default: genres["genres"][0..length])
#@category_chosen = prompt.select("Which category would you like to play?", genres["genres"])