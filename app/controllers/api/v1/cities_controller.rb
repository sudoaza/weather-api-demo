class Api::V1::CitiesController < ApiController
  include OpenWeatherConcern

  def search
    @response = OpenWeather::Find.accurate(search_query, options)
    return render json: [] unless success?
    render json: @response['list']
  end

  def search_query
    params.require(:q)
  end

  def current
    @response = OpenWeather::Current.city_id(city_id, options)
    return render json: {error: 'Not Found'}, status: :not_found if not_found?
    return render json: {} unless success?
    render json: @response
  end

  def city_id
    params.require(:id).to_i
  end
end
