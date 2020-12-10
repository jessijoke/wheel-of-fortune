require_relative '../config/environment.rb'

class QuoteAPI
    def initialize(url="https://quote-garden.herokuapp.com/api/v2/genres")
        @URL = url 
        get_categories
    end

    def get_categories
        uri = URI.parse(@URL)
        response = Net::HTTP.get_response(uri)

        response.body
    end

    def parse_json
        info = get_categories
        JSON.parse(info)
    end
end


#@url = "https://quote-garden.herokuapp.com/api/v2/genres/" + url + "?page=1&limit=10"

#binding.pry

#iterates through the parsed json and extracts an array of quotes 
#newtest = test.parse_json
#testarray2 = []
#newtest["quotes"].each { |el| testarray2 << el.values_at("quoteText") }

#end result
# testarray2
# => [["To lead people walk behind them."],
#  ["Doing nothing is better than being busy doing nothing."],
#  ["You can observe a lot just by watching."],
#  ["Trouble is only opportunity in work clothes."],
#  ["Learning is a treasure that will follow its owner everywhere"],
#  ["Think how hard physics would be if particles could think."],
#  ["Don't wait. The time will never be just right."],
#  ["The day is already blessed, find peace within it."],
#  ["Difficulties increase the nearer we get to the goal."],
#  ["Study the past, if you would divine the future."]]

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Get all genres

# https://quote-garden.herokuapp.com/api/v2/genres

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Quotes by genre
#
# https://quote-garden.herokuapp.com/api/v2/genres/:genreName?page=1&limit=10

