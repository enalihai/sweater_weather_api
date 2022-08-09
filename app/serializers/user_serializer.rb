class UserSerializer
  def self.create_user(user)
    {
      'data': {
        'type': 'users',
        'id': user.id,
        'attributes': {
          'email': user.email
        }
      }
    }
  end
end