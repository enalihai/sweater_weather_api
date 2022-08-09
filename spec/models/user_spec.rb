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

      expect(user).to_not have_key :password
      expect(user).to have_key :password_digest
      expect(user.password_digest).to_not eq('five')
    end
  end 
end
