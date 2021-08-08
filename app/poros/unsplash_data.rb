class UnsplashData
  attr_reader :photos_data

  def initialize(unsplash_data, location)
    @photos_data = unsplash_data[:results].map do |photo_info|
      {
        image: {
          location: location,
          image_url: photo_info[:urls][:full],
          credit: {
            source: 'https://unsplash.com/',
            logo: 'https://unsplash.com/s/photos/unsplash-logo',
            author: photo_info[:user][:name],
            author_portfolio: photo_info[:user][:portfolio_url],
            unsplash_source_comment: 'Require the image URLs returned by the API to be directly used or embedded in application (also known as hotlinking)'
          }
        }
      }
    end
  end
end
