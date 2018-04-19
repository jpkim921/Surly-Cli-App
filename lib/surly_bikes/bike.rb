# class creates the bike object

class SurlyBikes::Bike
  attr_accessor :bike_info, :bike_specs, :geometry, :frame_highlights

  def initialize(hash)
    hash.each do |k, v|
      self.send(("#{k}="), v)
      # binding.pry
    end
  end

end
