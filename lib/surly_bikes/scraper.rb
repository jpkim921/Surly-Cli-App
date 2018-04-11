require_relative '../surly_bikes'
require 'pry'

class SurlyBikes::Scraper
  attr_accessor :url_list

  def self.tester
    puts "Bike Categories"
    puts <<-DOC
      1. Pavement
      2. Touring
      3. Haulin'
      4. Trail
    DOC
  end

  def initialize
    @url_list = Nokogiri::HTML(open('https://surlybikes.com/bikes')).css('div div.span-6.bike-block.left a').collect {|x| x.attribute('href').text}
  end

  # # return a list of all urls for all bikes
  # def self.scrape_model_urls
  #   @url_list = Nokogiri::HTML(open('https://surlybikes.com/bikes')).css('div div.span-6.bike-block.left a').collect {|x| x.attribute('href').text}
  # end


  def create_bike_nav_urls
    # url = url_list[0]

    url_list.collect do |url|
      Nokogiri::HTML(open(url)).css('div#info-nav.desktop a').collect do |x|
        [x.attribute('href').text.to_sym, url + "/" + x.attribute('href').text]
      end.to_h

    end

  # binding.pry
    # url_list.each do |url|
    #   bike = Nokogiri::HTML(open(url))
    #   binding.pry
      # first thing to do is to create the nav_bar_urls
      # Nokogiri::HTML(open(url)).collect do |bike|
      #     # bike
      #     binding.pry
      #   end
      # Nokogiri::HTML(open(url)).css('#info-nav a').collect {|x| url + "/" + x.attribute('href').text}
    # end

  end

end #<--class end
