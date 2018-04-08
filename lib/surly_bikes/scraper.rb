require_relative '../surly_bikes'
require 'pry'

class SurlyBikes::Scraper
  attr_accessor :data

  def self.tester
    puts "Bike Categories"
    puts <<-DOC
      1. Pavement
      2. Touring
      3. Haulin'
      4. Trail
    DOC
  end


  def self.scrape_models_url_by_category
      # return an array of hashes:
      # [{pavement:
      #   {midnightspecial:"https://surlybikes.com/bikes/midnight_special"},
      #   crosscheck: "https://surlybikes.com/bikes/cross_check"
      #   },
      #   {touring: {bridgeclub:"https://surlybikes.com/bikes/bridge_club"},
      #   pugsley: "https://surlybikes.com/bikes/pugsley"
      #   }]

      data = Nokogiri::HTML(open('https://surlybikes.com/bikes'))

  end
# binding.pry
end


#
# div.bike-grp.clear.product-grid
# div.block-title-banner


# pulls the category
# div#wrapper --> h1.bolt-header => all the category text
# data.css('div#wrapper').css('h1.bolt-header').each {|x| puts x.text}




#pulls the bike names
# section = data.css('div#wrapper')
# section.css('div.bike-grp.clear.product-grid').css('div.block-title-banner').each{|x| puts x.text}

# creates an array of hashes by category
# section.css('h1.bolt-header').collect {|x| bike_hash[:"#{x.text}"] = {}}
# => {:Pavement=>{}, :Touring=>{}, :Haulin’=>{}, :Trail=>{}}


# section.css('h1.bolt-header').collect do |x|
# 	bike_hash[:"#{x.text}"] = {}

	#find the bike models

# end


# the below specifically calls the bike model name
# data.css('.block-title-banner').collect{|x| x.text}





# collection of bike models
# data.css('div a').collect {|x| x.css('div.block-title-banner').text}
# => ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "Midnight Special", "Cross-Check", "Steamroller", "Flat Bar Cross-Check", "Straggler", "Straggler 650b", "Pacer", "Travelers Check", "Bridge Club", "Pugsley", "Pack Rat", "Long Haul Trucker", "Disc Trucker", "Ogre", "Troll", "ECR 29+", "ECR 27+", "Big Fat Dummy", "Big Dummy", "Bill Trailer", "Ted Trailer", "Ice Cream Truck", "Wednesday", "Krampus", "Karate Monkey SS", "Karate Monkey 27.5+", "Instigator 2.0", ""]






#page
#
# bike-grp clear product-grid
#
# span-6 bike-block left
#
# block-title-banner
#
#
#
#
#
# section = data.css('#page')
# section = data.css('.bike-grp.clear.product-grid')
# bike = section.css('.span-6.bike-block.left')
# bike.css('a').attribute('href').text => URL
# bike.css('.block-title-banner').text => bike model
#
#
#
#
# data.css('div div a').each {|x| puts x.attribute('href').text} => ALL URLs
# data.css('div div.span-6.bike-block.left a').each {|x| puts x.attribute('href').text} ==> only bike links
#
#
#
# data.css('#page h1.bolt-header').collect {|x| x.text} => category
#
# data.css('h1.bolt-header').collect{|x| x.text} => category
#
#
#
# makes an array of hashes for each categroy
# data.css('#page h1.bolt-header').collect do |section|
# {section.text.to_sym => "Url"}
# end
