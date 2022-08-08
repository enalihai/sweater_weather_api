class Coordinate
  attr_reader :lat,
              :lon

  def initialize(data)
    binding.pry
    @lat = data[0][:locations][0][:latLng][:lat]
    @lon = data[0][:locations][0][:latLng][:lng]
  end 
end