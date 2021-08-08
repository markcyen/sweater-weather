class Api::V1::BackgroundController < ApplicationController
  def index
    image = ImageFacade.get_image_data(params[:query], params[:per_page])
    render json: BackgroundSerializer.package_background(image)
  end
end
