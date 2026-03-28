require 'nokogiri'
require 'open-uri'

class Scraper

  BASE_PATH = "https://www.basketball-reference.com"
  YEAR = Time.new.year
  
  def self.get_roster_page
    html = URI.open("#{BASE_PATH}/teams/BOS/#{YEAR}.html")
    doc = Nokogiri::HTML(html)
  end

  def self.get_quotes_page
    html = URI.open("http://www.notable-quotes.com/a/auerbach_red.html")
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

  def self.get_stats(player)
    url = player.url
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    stats = {}
    doc.css(".stats_pullout div div").each do |div|
      label_span = div.css("span.poptip").first
      next unless label_span
      raw_label = label_span["data-tip"] || label_span.css("strong").text
      label = Nokogiri::HTML.parse(raw_label).text.split(":").first.strip
      value = div.css("p").first&.text
      stats[label] = value if label && value
    end
    stats
  end
end
