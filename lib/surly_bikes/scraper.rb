require_relative '../surly_bikes'
require 'pry'

class SurlyBikes::Scraper
  attr_accessor :categories


  # method creates a hash by category => models within category => urls for each bike within category
  # contains the categories and bike names
  def self.setup
    bikes = {}
    categories.each do |category|
      bikes[category.to_sym] = SurlyBikes::Scraper.bike_list_by_category(category)
    end
    bikes
  end

  # method creates an array of categories
  def self.categories
    data = Nokogiri::HTML(open('https://surlybikes.com/bikes'))
    @categories = data.css('.bolt-header').collect{|x| x.text.downcase.gsub("\u2019", "")}
    # binding.pry
  end

  # method creates a hash of bike models and bike urls for specific category
  def self.bike_list_by_category(category)
    data = Nokogiri::HTML(open('https://surlybikes.com/bikes'))

    # array of bike names within the category
    name = data.css("#" + "#{category}" + " .block-title-banner").collect{|block| block.text}

    # array of bike urls within the category
    url = data.css("#" + "#{category}" + " div.bike-grp.clear.product-grid div.span-6.bike-block.left a").collect{|x| x.attribute('href').text}
    name.zip(url).to_h
  end


  # def self.scrape_bike_info_urls(url)
  def self.scrape_bike_info_urls(url)
    data = Nokogiri::HTML(open(url))
    data.css('div#info-nav.desktop a').collect {|x| [x.attribute('href').text.to_sym, url + "/" + x.attribute('href').text]}.to_h
  end




  def self.scrape_bike_info(hash)
  #	url = "https://surlybikes.com/bikes/midnight_special/bike_specs"
  #	@data = Nokogiri::HTML(open(url))

  	# hash = {:bike_info=>"https://surlybikes.com/bikes/midnight_special/bike_info", :bike_specs=>"https://surlybikes.com/bikes/midnight_special/bike_specs", :geometry=>"https://surlybikes.com/bikes/midnight_special/geometry", :frame_highlights=>"https://surlybikes.com/bikes/midnight_special/frame_highlights"}

  # hash = {:frame_highlights=>"https://surlybikes.com/bikes/midnight_special/frame_highlights"}
  # , :bike_specs=>"https://surlybikes.com/bikes/midnight_special/bike_specs", :geometry=>"https://surlybikes.com/bikes/midnight_special/geometry", :frame_highlights=>"https://surlybikes.com/bikes/midnight_special/frame_highlights"}

  	bike_info_hash = {}
  	hash.each do |type, url|

  		if type == "bike_info".to_sym
  			data = Nokogiri::HTML(open(url))
  			bike_info_hash[type.to_sym] = data.css('#bike-info p').text
  		elsif type == "bike_specs".to_sym
  			data = Nokogiri::HTML(open(url))
        left = data.css('#bike-build-specs .left strong').collect {|part_name| part_name.text}
        right = data.css('#bike-build-specs .last').collect {|part| part.text}
  			bike_info_hash[type.to_sym] = left.zip(right).to_h
      elsif type == "geometry".to_sym
  			data = Nokogiri::HTML(open(url))
  			bike_info_hash[type.to_sym] = "geometry"
  		elsif type == "frame_highlights".to_sym
  			data = Nokogiri::HTML(open(url))
  			bike_info_hash[type.to_sym] = "frame hightlights"
  		end
    end
    # binding.pry
	bike_info_hash
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
