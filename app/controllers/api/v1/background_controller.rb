class Api::V1::BackgroundController < ApplicationController
  def index
    params[:per_page] = 1 if params[:per_page] == nil
    if params[:query].present? && !numeric(params[:query])
      image = ImageFacade.get_image_data(params[:query], params[:per_page])
      render json: BackgroundSerializer.package_background(image)
    else
      render json: { error: 'Not a valid query' }, status: :not_found
    end
  end
end
