class Coordinate
  attr_reader :lat,
              :lon

  def initialize(data)
    @lat = data[:results][0][:locations][0][:latLng][:lat]
    @lon = data[:results][0][:locations][0][:latLng][:lng]
  end 
end