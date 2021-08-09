class UserSerializer
  include JSONAPI::Serializer
  # attributes :email, :api_key

  def self.create_new(user)
    binding.pry
    {
      data: {
        id: user.id,
        type: 'users',
        attributes: {
          email: user.email,
          api_key: user.api_key
        }
      }
    }
  end
end
