class Api::V1::CitiesController < ApiController
  def search
  end

  def search_params
    params.require(:q)
  end

  def current
  end

  def current_params
    params.require(:id)
  end
end
