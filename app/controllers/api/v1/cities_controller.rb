require 'open_weather'

class Api::V1::CitiesController < ApiController
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

  def options
    # clone is safe to remove once this is fixed https://github.com/coderhs/ruby_open_weather_map/issues/37
    Rails.configuration.open_weather.clone
  end

  def response_code
    @response['cod'].to_i
  end

  def success?
    response_code == 200
  end

  def not_found?
    response_code == 404
  end
end
