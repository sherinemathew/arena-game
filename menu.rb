# menu file containing the methods used for the main menu and list commands

require_relative './player_class'
require_relative './enemies'

# prints out the available commands
def list_commands
    puts UI_ARROW.light_yellow + " " + "'fight', 'f', or 'battle' to view enemies and fight."
    puts UI_ARROW.light_yellow + " " + "'armoury' or 'a' to go to the armoury."
    puts UI_ARROW.light_yellow + " " + "'stats' to view your current status."
    puts UI_ARROW.light_yellow + " " + "'clear' or 'cls' to clear the screen."
    puts UI_ARROW.light_yellow + " " + "'quit', 'q', or 'exit' to abandon your journey."
    puts
end

# main menu, also acts as the home area
def main_menu(player)
    quit = false # boolean used to exit menu loop
    while quit != true # while loop to keep player in menu unless choice is made
        puts
        puts "Type 'commands' for a list of available commands."
        print UI_ARROW.red + " "
        input = gets.chomp.strip.downcase
        puts
        case input # switch statement to go to player menu choice
        when 'fight', 'f', 'battle'
            player.choose_enemy
        when 'armoury', 'a'
            player.armoury
        when 'stats'
            player.view_stats
        when 'commands'
            list_commands
        when 'clear', 'cls' 
            system 'clear'
        when 'quit', 'q', 'exit'
            abort("Look, bud. You leave now and you forfeit your body count!".red)
        when 'godmode'
            player.level = 100
            player.coins = 5000
        else
            puts "That's not an available command"
        end
    end
end
