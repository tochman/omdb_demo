class Api::V0::MoviesController < ApplicationController
  def index
    api_endpoint = 'http://www.omdbapi.com/?i=tt3896198&apikey=36ecbc39'
    search_string = 'A New Hope'
    results = RestClient.get(api_endpoint + "&s=#{search_string}")
    render json: JSON.parse(results.body)
  end
end
