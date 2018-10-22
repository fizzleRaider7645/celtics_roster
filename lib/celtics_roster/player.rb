require 'nokogiri'
require 'open-uri'

class CelticsRoster::Player
  attr_accessor :name, :number, :position

  @@full_roster = []

  def initialize(name, number, position)
    @name = name
    @number = number
    @position = position
  end

  def self.create_player(url)
    html = open(url)
    doc = Nokogiri::HTML(html)
  end

  def self.all
    @@full_roster
  end
end
