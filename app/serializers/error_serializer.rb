class ErrorSerializer
  include JSONAPI::Serializer

  def self.send_error(message)
    {
      data: {
        type: 'error',
        error_message: message
      }
    }
  end
end
