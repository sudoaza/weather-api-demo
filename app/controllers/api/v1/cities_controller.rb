require 'open_weather'

class Api::V1::CitiesController < ApiController
  def search
    cities_result = OpenWeather::Find.accurate(search_query, options)
    return render json: [] unless cities_result['cod'] == "200"
    render json: cities_result['list']
  end

  def search_query
    params.require(:q)
  end

  def current
    current_weather = OpenWeather::Current.city_id(city_id, options)
    return render json: {error: 'Not Found'}, status: :not_found if current_weather['cod'] == "404"
    return render json: [] unless current_weather['cod'] == "200"
    render json: current_weather['list']
  end

  def city_id
    params.require(:id).to_i
  end

  def options
    # clone is safe to remove once this is fixed https://github.com/coderhs/ruby_open_weather_map/issues/37
    Rails.configuration.open_weather.clone
  end
end
