class Coordinate
  attr_reader :lat,
              :lon

  def initialize(data)
    binding.pry
    @lat = data[:results].first[:locations].first[:latLng][:lat]
    @lon = data[:results].first[:locations].first[:latLng][:lng]
  end 
end