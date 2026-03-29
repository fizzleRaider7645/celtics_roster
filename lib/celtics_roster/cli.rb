# require 'tty-font'
# require 'pastel'

class CelticsRoster::CLI

  def call
    system "clear"
    welcome
    sleep(1)
    display_roster
    display_leaders
    menu
    goodbye
  rescue Interrupt
    puts ""
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
    elsif input.downcase == 'random'
      player = CelticsRoster::Player.random_player
      puts Pastel.new.green.bold("\n🎲 Random pick: #{player.name}!")
      display_stats(player)
      menu
    elsif input.to_i == 0 && input.length > 0
      matches = CelticsRoster::Player.find_by_name(input)
      if matches.length == 1
        display_stats(matches.first)
        menu
      elsif matches.length > 1
        puts Pastel.new.yellow.bold("\nMultiple matches:")
        matches.each_with_index { |p, i| puts "  #{i + 1} - #{p.name} - #{p.position}" }
        menu
      else
        puts Pastel.new.red.bold("No player found matching '#{input}'. Try again.")
        menu
      end
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

  def display_leaders
    color = Pastel.new
    leaders = Scraper.get_team_leaders
    puts ""
    puts color.green.bold("  ★ TEAM LEADERS ★")
    puts color.bold("  PTS: ") + "#{leaders[:pts][:name]} (#{leaders[:pts][:pts]})"
    puts color.bold("  REB: ") + "#{leaders[:trb][:name]} (#{leaders[:trb][:trb]})"
    puts color.bold("  AST: ") + "#{leaders[:ast][:name]} (#{leaders[:ast][:ast]})"
    puts ""
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
    print "Enter list number, player name, 'random', or 'exit': "
    gets.chomp
  rescue Interrupt
    raise Interrupt
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
