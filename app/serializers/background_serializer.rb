class BackgroundSerializer
  include JSONAPI::Serializer

  def self.package_background(image)
    {
      data: {
        id: nil,
        type: 'image',
        attributes: {
          image: image.photos_data
        }
      }
    }
  end
end
