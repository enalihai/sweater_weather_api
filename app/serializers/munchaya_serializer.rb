class MunchayaSerializer
  def self.serialize_input(pmd)
        {
          "data": {
            "id": nil,
            "type": "munchie",
            "attributes": {
              "destination_city": "#{pmd[1][:bussinesses][0][:location][:city]}, #{pmd[1][:bussinesses][0][:location][:state]}",
              "forecast": {
                "summary": "#{pmd[1]}",
                "temperature": "#{pmd[1]}"
              },
              "restaurant": {
                "name": "#{pmd[:businesses][0][:name]}",
                "address": "#{pmd[:businesses][0][:location][:address_1]}"
                # need to come back here and create a method to separate the full address
              }
            }
          }
        }
  end
end


# { :address1=>"1620 S Prairie Ave", 
#   :address2=>nil, 
#   :address3=>nil, 
#   :city=>"Pueblo", 
#   :country=>"US", 
#   :display_address=>["1620 S Prairie Ave", "Pueblo, CO 81005"], 
#   :state=>"CO", :zip_code=>"81005"}