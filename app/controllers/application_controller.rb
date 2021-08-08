class ApplicationController < ActionController::API
  def numeric(params)
    Float(params) != nil rescue false
  end
end
