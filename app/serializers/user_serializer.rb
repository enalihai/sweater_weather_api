class UserSerializer
  def self.serialize_user(user)
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
