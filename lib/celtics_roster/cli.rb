require 'pry'

class CelticsRoster::CLI

  def call
    list_players
    see_player_bio
  end

  def list_players
    #get_player
    puts  <<-DOC.gsub /^\s/, ""
    "Your Boston Celtics"
      1. player one
      2. player two
      3. player three
      4. player four
    DOC
  end

  def see_player_bio
    puts "select a player to see their bio"
    input = gets.chomp
    unless exit(input)
      case input
      when "1"
        puts "player one"
      when "2"
        puts "player two"
      when "3"
        puts "player three"
      when "4"
        puts "player 4"
      else
        puts "invalid entry"
        sleep(2)
        system "clear"
        call
      end
    end
  end

  def exit(input)
    if input == "exit"
      return true
    end
    return false
  end

end
