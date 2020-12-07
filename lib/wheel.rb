require_relative '../config/environment.rb'

module Spinthewheel

    def wheel
        wheelvalues = [800, 500, 650, 500, 900, "Bankrupt", 5000, 500, 900, 700, 600, 800, 500, 700, 500, 600, 550, 500, 900, "Bankrupt", 650, 900, 700, 2500]
        wheelvalues.sample(1)
    end

end
