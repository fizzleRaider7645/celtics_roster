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

  def display_stats(player)
    puts "#{player.name}"
    stats_hash = Scraper.get_stats(player)
    stats_hash.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

  def menu
    input = get_user_input
    if valid_input?(input)
      player = CelticsRoster::Player.select_player(input.to_i)
      display_stats(player)
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
    puts " "
    print "Select the player's 'list number' to see current season stats, or enter 'exit': "
    input = gets.chomp
  end

  def valid_input?(input)
    return true if input.to_i.between?(1, CelticsRoster::Player.all.count)
  end

  def goodbye
    system "clear"
    quote = Scraper.get_quotes
    puts quote
    puts "-RED AUERBACH"
  end

end
