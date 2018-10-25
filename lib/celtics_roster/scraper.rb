require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper

  BASE_PATH = "https://www.basketball-reference.com"

  def self.get_roster_page
    html = open("https://www.basketball-reference.com/teams/BOS/2019.html")
    doc = Nokogiri::HTML(html)
  end

  def self.get_quotes_page
    html = open("http://www.notable-quotes.com/a/auerbach_red.html")
    doc = Nokogiri::HTML(html)
  end

  def self.get_players
    doc = self.get_roster_page
    rows = doc.css("#roster").css("tr")
    rows.each.with_index do |row, i|
      next if i == 0
      name = row.css("td.left a")[0].text
      position = row.css("td.center").text
      number = row.css("th.center").text
      url = BASE_PATH + row.css("td.left a")[0].attributes["href"].text
      CelticsRoster::Player.new(name, position, number, url)
    end
  end

  def self.get_quotes
    doc = self.get_quotes_page
    quotes = doc.css(".quotation").map { |quote| quote.text }.sample
  end

  def self.get_stats(player = nil)
    # url = player.url
    url = "https://www.basketball-reference.com/players/i/irvinky01.html"
    html = open(url)
    doc = Nokogiri::HTML(html)
    summary = doc.css(".stats_pullout").css(".p1").css("div")
    sections = summary.css("h4").map { |sec| sec.text }
    nums =  summary.css("p").children.map.with_index do |num, index|
      next if index.odd?
      num.text
    end.compact
    i = 0
    while i < sections.length
      
    end
  end
end
