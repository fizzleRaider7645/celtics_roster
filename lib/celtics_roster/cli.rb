# require 'tty-font'
# require 'pastel'

class CelticsRoster::CLI

  def call
    system "clear"
    welcome
    sleep(1)
    display_roster
    menu
    goodbye
  end

private

  def menu
    input = get_user_input
    if valid_input?(input)
      player = CelticsRoster::Player.select_player(input.to_i)
      display_stats(player)
      menu
    elsif input == 'exit'
      return
    else
      puts Pastel.new.red.bold("Invalid input. Please re-enter.")
      menu
    end
  end

  def display_roster
    puts""
    CelticsRoster::Player.generate_players
    CelticsRoster::Player.display_roster
  end

  def display_stats(player)
    puts ""
    puts "******************************"
    puts "     ~##{player.number}-#{player.name}~"
    puts "******************************"
    stats_hash = Scraper.get_stats(player)
    stats_hash.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

  def get_user_input
    puts ""
    print "Select the player's 'list number' to see current season stats, or enter 'exit': "
    input = gets.chomp
  end

  def valid_input?(input)
    return true if input.to_i.between?(1, CelticsRoster::Player.all.count)
  end

  def goodbye
    system "clear"
    quote = Scraper.get_quotes
    puts Pastel.new.italic(quote)
    puts Pastel.new.red.bold("-RED AUERBACH").center(quote.length * 2)
  end

  def welcome
    font = TTY::Font.new(:doom)
    color = Pastel.new
    puts color.green.on_black.bold(font.write("The Boston Celtics"))
  end

end
