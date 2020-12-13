require_relative '../config/environment.rb'


module Banners

        def title
            begin
                Catpix::print_image "../wheel-of-fortune/images/banner.jpg",
                    :limit_x => 1.0,
                    :limit_y => 0,
                    :center_x => true,
                    :center_y => true,
                    :bg => "black",
                    :bg_fill => false
            rescue
                Catpix::print_image "../wheeloffortune/images/banner.jpg",
                        :limit_x => 1.0,
                        :limit_y => 0,
                        :center_x => true,
                        :center_y => true,
                        :bg => "black",
                        :bg_fill => false
            end
        end

        def game_board_border
        puts "<o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o><o>".colorize(:red)
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
            begin
                Catpix::print_image "../wheel-of-fortune/images/win.jpg",
                    :limit_x => 1.0,
                    :limit_y => 0,
                    :center_x => true,
                    :center_y => true,
                    :bg => "black",
                    :bg_fill => false
            rescue
                Catpix::print_image "../wheeloffortune/images/win.jpg",
                    :limit_x => 1.0,
                    :limit_y => 0,
                    :center_x => true,
                    :center_y => true,
                    :bg => "black",
                    :bg_fill => false
            end 
        end

        def lose_image
            begin
                Catpix::print_image "../wheel-of-fortune/images/lose.png",
                    :limit_x => 1.0,
                    :limit_y => 0,
                    :center_x => true,
                    :center_y => true,
                    :bg => "black",
                    :bg_fill => false
            rescue
                Catpix::print_image "../wheeloffortune/images/lose.png",
                    :limit_x => 1.0,
                    :limit_y => 0,
                    :center_x => true,
                    :center_y => true,
                    :bg => "black",
                    :bg_fill => false
            end
        end

        def end_banner(end_message)
            blank_link
            game_board_border
            blank_link
            puts end_message
            blank_link
            game_board_border
            blank_link
        end
end