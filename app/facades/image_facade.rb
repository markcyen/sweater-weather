class ImageFacade
  def self.get_image_data(search_location, per_page = 1)
    image_data = UnsplashService.retrieve_background_image(search_location, per_page)
    UnsplashData.new(image_data, search_location)
  end
end
