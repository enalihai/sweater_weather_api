class Trail
  attr_reader :id,
              :trail_name,
              :difficulty,
              :parking,
              :loops

  def initialize(data)
    binding.pry
    @id = data[:id]
    @trail_name = data[:name]
    @difficulty = data[:difficulty]
    @parking = data[:parking]
    @loops = data[:loops]
  end
end