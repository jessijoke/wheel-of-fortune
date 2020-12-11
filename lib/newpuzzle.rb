require_relative '../config/environment.rb'


class Newpuzzle
    attr_accessor  :all_genres

    def select_puzzle(category_chosen)
        puzzle = GenreAPI.new("https://quote-garden.herokuapp.com/api/v2/genres/" + category_chosen + "?page=1&limit=1000").parse_json_quote
        final_choice = puzzle[0]["quoteText"]
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

   #def genre_objects
    #    @genre.each { |genre| Genre.new(genre) }
    #end