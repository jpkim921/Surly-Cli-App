# CLI Controller
# require_relative '../surly_bikes'

class SurlyBikes::CLI
  attr_accessor :category_array, :input

  def call
    setup
    greetings
    list_categories
    SurlyBikes::Scraper.scrape_bike_info
    # binding.pry
  end

  def setup
    @category_array = SurlyBikes::Scraper.setup.keys
  end

  def greetings
    puts "\nWELCOME TO SURLY BIKES - CLI Version\n\n"
  end

  def list_categories
    puts "Select a category from below:\n\n"
    # category_array = SurlyBikes::Scraper.setup.keys
    self.category_array.each_with_index do |category, index|
      # puts index + ". " + category.to_s.capitalize
      puts "#{index + 1}. #{category.to_s.capitalize}"
    end
    print "\nType category: "
    @input = gets.strip.downcase.to_sym

    if self.category_array.include?(input) # || (1..self.category_array.length).include?(input.to_i)
      return self.input
    elsif input.to_s == "exit"
      self.end
    else
      self.list_categories
    end
  end


  def list_bikes
    
  end


  def end
    puts "Visit https://surlybikes.com/ to check out more bike goodness!!!"
    exit
  end


#   attr_accessor :bike_hash
#
# 	BIKE_HASH = {:touring=>["Midnight", "Twilight"], :pavement=>["Sunrise", "Sunset"], :dirt=>["Rain", "Cloudy"], :haulin=>["Sunny", "Rain_2"]}
#
# 	# def initialize
# # 		@bike_hash = {:touring=>["1. Midnight", "2. Twilight"], :pavement=>["1. Sunrise", "2. Sunset"], :dirt=>["1. Rain", "2. Cloudy"], :haulin=>["1. Sunny", "2. Rain"]}
# # 	end
#
#
#   def self.start
#     puts "\nWELCOME TO SURLY BIKES - CLI Version\n\n"
#     self.bikes_or_category
#     SurlyBikes::Scraper.new.create_bike_nav_urls
#
#   end
#
#
# 	def self.category_list
# 		puts "1. Touring"
# 		puts "2. Pavement"
# 		puts "3. Dirt"
# 		puts "4. Haulin"
# 		puts 'Or type "All" for a list of all bikes.'
#
# 	end
#
#
# 	def self.bikes_or_category
#
# 		puts "PICK A CATEGORY OF BIKES TO VIEW (Enter Number): "
# 		self.category_list
#
# 		input = nil
# 		while input != "exit"
# 			input = gets.strip!
#
# 			if input == "1"
# 				BIKE_HASH[:touring].each_with_index{|bike, index| puts "#{index + 1}. #{bike}"}
# 				puts "\nPICK A BIKE FOR MORE INFO: "
# 			elsif input == "2"
# 				BIKE_HASH[:pavement].each_with_index{|bike, index| puts "#{index + 1}. #{bike}"}
# 			elsif input == "3"
# 				BIKE_HASH[:dirt].each_with_index{|bike, index| puts "#{index + 1}. #{bike}"}
# 			elsif input == "4"
# 				BIKE_HASH[:haulin].each_with_index{|bike, index| puts "#{index + 1}. #{bike}"}
# 			elsif input.downcase == 'all'
# 				BIKE_HASH.values.flatten.each_with_index{|bike, index| puts "#{index + 1}. #{bike}"}
# 			else
# 				puts "Try again: "
# 			end
# 		end
# 	end




end
