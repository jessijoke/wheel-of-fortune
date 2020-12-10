require_relative '../config/environment.rb'


module Banners

        def title
            Catpix::print_image "../images/banner.jpg",
                :limit_x => 1.0,
                :limit_y => 0,
                :center_x => true,
                :center_y => true,
                :bg => "black",
                :bg_fill => true
        end

        def game_board_border
        puts "<o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o>".colorize(:red)
        end

        def blank_link
        puts "                               "
        end

        def welcome
            puts "
╦ ╦┌─┐┬  ┌─┐┌─┐┌┬┐┌─┐  ┌┬┐┌─┐  ╦ ╦┬ ┬┌─┐┌─┐┬    ┌─┐┌─┐  ╔═╗┌─┐┬─┐┌┬┐┬ ┬┌┐┌┌─┐┬
║║║├┤ │  │  │ ││││├┤    │ │ │  ║║║├─┤├┤ ├┤ │    │ │├┤   ╠╣ │ │├┬┘ │ │ ││││├┤ │
╚╩╝└─┘┴─┘└─┘└─┘┴ ┴└─┘   ┴ └─┘  ╚╩╝┴ ┴└─┘└─┘┴─┘  └─┘└    ╚  └─┘┴└─ ┴ └─┘┘└┘└─┘o
            ".colorize(:yellow)
        end

        def menu_banner
            puts"
            Choose an option:
+-------------------------+------------------------+----------------------------+
|   Spin the Wheel (s)    |    Buy a Vowel? (v)    |    Solve the Puzzle? (sv)  |
+-------------------------+------------------------+----------------------------+
            ".colorize(:magenta)
        end

        def score_board(name, score)
            puts"
+-------------------------+
#{name}: $#{score}               
+-------------------------+"
        end

        def display_top
            blank_link
            game_board_border
        end

        def display_bottom
            blank_link
            game_board_border
        end

        def start
            title
            blank_link
            welcome
        end

        def win_image
            Catpix::print_image "../images/win.jpg",
                :limit_x => 1.0,
                :limit_y => 0,
                :center_x => true,
                :center_y => true,
                :bg => "black",
                :bg_fill => true
        end

        def lose_image
            Catpix::print_image "../images/lose.png",
                :limit_x => 1.0,
                :limit_y => 0,
                :center_x => true,
                :center_y => true,
                :bg => "black",
                :bg_fill => true
        end
end