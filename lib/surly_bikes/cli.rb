# CLI Controller
require_relative '../surly_bikes'
class SurlyBikes::CLI

  def greeting
    # list_bikes
    menu
    goodbye
  end

  def list_bikes
    puts "Bike Categories"
    puts <<-DOC
      1. Pavement
      2. Touring
      3. Haulin'
      4. Trail
    DOC
  end

  def menu
    # puts "Enter the number of the category you would like to browse:"

    input = nil
    while input != "exit"
    puts "Enter the number of the category you would like to browse or type exit to end:"
    list_bikes
    SurlyBikes::Scraper.tester
    input = gets.strip.downcase
      case input
        when "1"
          puts "list of Pavement category bikes"
        when "2"
          puts "list of Touring category bikes"
        when "3"
          puts "list of Haulin' category bikes and trailers"
        when "4"
          puts "list of Trail category bikes"
      end
    end
  end

  def goodbye
    puts "Contact your local Surly dealer for more info."
  end

end
