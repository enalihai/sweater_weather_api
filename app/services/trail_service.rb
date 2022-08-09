class TrailService
  def self.get_trails(query)
    binding.pry
    response = conn.get('/api/filter/?by=city') do |f|
      f.params[:city] = city
      f.params[:count] = quantity

  end

  def self.conn
    Faraday.new('https://prescriptiontrails.org') do |f|
      f.params[:offset] = 0
    end
  end
end