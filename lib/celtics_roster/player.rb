class CelticsRoster::Player
  attr_accessor :name, :number, :position

  @@full_roster = []

  def initialize(name, position, number, url)
    @name = name
    @number = number
    @position = position
    @url = url

    @@full_roster << self
  end

  def self.generate_players
    Scraper.get_players
  end

  def self.all
    @@full_roster
  end

  def self.display_roster
    self.all.each_with_index do |player, index|
      puts "#{index + 1} - #{player.name} - #{player.position}"
    end
    nil
  end

  def self.select_player(input)
    self.all[input - 1]
  end
end
