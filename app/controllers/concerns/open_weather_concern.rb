module OpenWeatherConcern
  require 'open_weather'

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
