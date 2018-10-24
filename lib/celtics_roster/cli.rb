require 'pry'

class CelticsRoster::CLI

  def call
    display_roster
    menu
    goodbye
  end

  def display_roster
    CelticsRoster::Player.generate_players
    CelticsRoster::Player.display_roster
  end

  # def menu
  #   puts "Select the player's 'list number' to see their more info., or enter 'exit'"
  #   input = gets.chomp
  #   until input == 'exit'
  #     if valid_input?(input)
  #       player = CelticsRoster::Player.select_player(input.to_i)
  #       puts player.name
  #       menu
  #     else
  #       puts "Invalid input. Please re-enter"
  #       menu
  #     end
  #   end
  # end

  def menu
    input = get_user_input
    if valid_input?(input)
      player = CelticsRoster::Player.select_player(input.to_i)
      puts player.name
      menu
    elsif input == 'exit'
      return
    else
      puts "Invalid input. Please re-enter."
      menu
    end
  end

private

  def get_user_input
    puts "Select the player's 'list number' to see their more info., or enter 'exit'"
    input = gets.chomp
  end

  def valid_input?(input)
    return true if input.to_i.between?(1, CelticsRoster::Player.all.count)
  end

  def goodbye
    puts "Red Quote"
  end

end
