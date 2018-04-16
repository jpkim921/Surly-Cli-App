require_relative '../surly_bikes'
require 'pry'

class SurlyBikes::Scraper
  attr_accessor :categories
  # def initialize
  # @data = Nokogiri::HTML(open('https://surlybikes.com/bikes'))
  # end


  def self.categories
    data = Nokogiri::HTML(open('https://surlybikes.com/bikes'))
    @categories = data.css('.bolt-header').collect{|x| x.text.downcase.gsub("\u2019", "")}
    # binding.pry
  end

  def self.setup
    data = Nokogiri::HTML(open('https://surlybikes.com/bikes'))
    bikes = {}
    categories.each do |category|
      bikes[category.to_sym] = "URL"
    	bikes[category.to_sym] = SurlyBikes::Scraper.bike_list_by_category(category)
    end
    binding.pry
    bikes
  end


  def self.bike_list_by_category(category)
  	# bike = {}
  	# section = data.css('section#' + "#{category}" + ' div.bike-grp.clear.product-grid a')
    data = Nokogiri::HTML(open('https://surlybikes.com/bikes'))

    name = data.css("#" + "#{category}" + " .block-title-banner").collect{|block| block.text}
    url = data.css("#" + "#{category}" + " div.bike-grp.clear.product-grid div.span-6.bike-block.left a").collect{|x| x.attribute('href').text}
    name.zip(url).to_h
    # binding.pry
  # bike
  end

















  # <------------------------ORIGINAL------------------------>
  # <------------------------ORIGINAL------------------------>


  # attr_accessor :url_list
  #
  # def self.tester
  #   puts "Bike Categories"
  #   puts <<-DOC
  #     1. Pavement
  #     2. Touring
  #     3. Haulin'
  #     4. Trail
  #   DOC
  # end
  #
  # # collects all the bike urls
  # def initialize
  #   @url_list = Nokogiri::HTML(open('https://surlybikes.com/bikes')).css('div div.span-6.bike-block.left a').collect {|x| x.attribute('href').text}
  # end
  #
  # # collects all nav urls for the different tabs within each bike page
  # def create_bike_nav_urls
  #   url_list.collect do |url|
  #     Nokogiri::HTML(open(url)).css('div#info-nav.desktop a').collect do |x|
  #       [x.attribute('href').text.to_sym, url + "/" + x.attribute('href').text]
  #     end.to_h
  #   end
  # end

# <------------------------ORIGINAL------------------------>
# <------------------------ORIGINAL------------------------>



end #<--class end
