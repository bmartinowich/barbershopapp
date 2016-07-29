class BarbersController < ApplicationController

  def index
      if params[:search]
        search = params[:search]
        url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{search}"
        response = RestClient::Request.execute(url: url, method: :get, verify_ssl: false)
        latlong_results = JSON.parse(response.body)
        @latlong = latlong_results["results"][0]["geometry"]["location"]
        latitude = @latlong["lat"]
        longitude = @latlong["lng"]

        url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=20000&keyword=barbershop&key=AIzaSyBphxDDxq3VS6OhGJqY302YqofiJB0dsZ4"
        response = RestClient::Request.execute(url: url, method: :get, verify_ssl: false)
        @results = JSON.parse(response)["results"]
      end

      if !@favorite
          @favorite = Favorite.new

      end
  end
end
