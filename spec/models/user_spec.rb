require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }

    it 'doesnt save the actual password' do
      user = User.create(
        email: 'model@test.com', 
        password: 'five', 
        password_confirmation: 'five'
      )
binding.pry
      expect(user.id).to be_a Integer
      expect(user.email).to eq 'model@test.com'
      expect(user.password_digest).to_not eq 'five'
    end
  end 
end
