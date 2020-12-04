require_relative '../config/environment.rb'
require 'catpix'


class Banners

        def title
            Catpix::print_image "../wheeloffortune/images/banner.jpg",
                :limit_x => 1.0,
                :limit_y => 0,
                :center_x => true,
                :center_y => true,
                :bg => "black",
                :bg_fill => true
        end

        def game_board_border
        puts "<o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o>"
        end

        def blank_link
        puts "                               "
        end
end