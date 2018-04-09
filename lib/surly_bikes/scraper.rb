require_relative '../surly_bikes'
require 'pry'

class SurlyBikes::Scraper
  # attr_accessor :data

  def self.tester
    puts "Bike Categories"
    puts <<-DOC
      1. Pavement
      2. Touring
      3. Haulin'
      4. Trail
    DOC
  end

  # return a list of all urls for all bikes
  def self.scrape_model_urls
    Nokogiri::HTML(open('https://surlybikes.com/bikes')).css('div div.span-6.bike-block.left a').collect {|x| x.attribute('href').text}
  end
  # binding.pry

  def self.create_bike_nav_urls(url)
    Nokogiri::HTML(open(url)).css('#info-nav a').collect {|x| url + "/" + x.attribute('href').text}
    # binding.pry
  end

end #<--class end
