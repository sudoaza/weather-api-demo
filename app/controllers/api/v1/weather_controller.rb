class Api::V1::WeatherController < ApiController
  include OpenWeatherConcern

  def coordinates
    lat, lon = coordinates_params
    @response = OpenWeather::Find.geocode(lat, lon, options)
    return render json: {}, status: :bad_request unless success?
    return render json: {}, status: :not_found if @response['list'].empty?
    render json: @response['list'].first
  end

  def coordinates_params
    params.require([:lat, :lon])
  end
end
