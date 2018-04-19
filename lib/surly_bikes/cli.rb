# CLI Controller
# require_relative '../surly_bikes'

class SurlyBikes::CLI
  attr_accessor :category_array, :input, :bike_info_specs, :bike

  def call
    setup
    greetings
    list_categories
    list_bikes
    bike_object
    display_bike
    again
    # binding.pry
    # SurlyBikes::Scraper.scrape_bike_info
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
    @input = gets.strip.downcase

    if self.category_array.include?(input.to_sym) # || (1..self.category_array.length).include?(input.to_i)
      return self.input
    elsif input == "exit"
      self.end
    else
      self.list_categories
    end
  end


  def list_bikes
    puts "Select a bike from below:\n\n"
    list = SurlyBikes::Scraper.bike_list_by_category(input)
    url_list = SurlyBikes::Scraper.bike_list_urls_by_category(input)
    list.each_with_index do |bike, index|
      puts "#{index + 1}. #{bike}"
    end
    print "\nType bike name: "
    bike_input = gets.strip.downcase
    # url_list
    # url_list[input.split(" ").join.to_sym]
    # binding.pry

    if list.map{|x| x.upcase}.include?(bike_input.upcase) # || (1..self.category_array.length).include?(input.to_i)
      # puts url_list[bike_input.split(" ").join.to_sym]
      url = url_list[bike_input.split(" ").join.to_sym]
      @bike_info_specs = SurlyBikes::Scraper.scrape_bike_info_urls(url)
      # binding.pry
    elsif bike_input == "exit"
      self.end
    else
      puts "\nOops! Try again!\n"
      self.list_bikes
    end
  end

  def bike_hash
    SurlyBikes::Scraper.scrape_bike_info(bike_info_specs)
  end

  def bike_object
    @bike = SurlyBikes::Bike.new(self.bike_hash)
  end

  def display_bike
    puts bike.bike_info
    # bike.bike_specs.each {|x| puts x}
    # binding.pry
    if bike.bike_specs != nil
      bike.bike_specs.each do |k,v|
        puts "\n#{k}:\n#{v}"
      end
    end
  end

  def again
    puts "\nLook at another bike (yes/no)?"
    input = gets.strip.downcase
    if input == "no"
      self.end
    elsif input == "yes"
      self.call
    end
  end


  def end
    puts "\nVisit https://surlybikes.com/ to check out more bike goodness!!!\n"
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
