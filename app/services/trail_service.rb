class TrailService
  def self.get_trail_data(quantity, city)
    response = conn.get('/api/filter/?by=city') do |f|
      f.params[:city] = city
      f.params[:count] = quantity
      f.params[:offset] = 0
    end
  end

  def self.conn
    Faraday.new('https://prescriptiontrails.org')
  end
end