class Api::V0::MoviesController < ApplicationController
  def index
    api_endpoint = "https://api.themoviedb.org/3/search/movie?api_key=80089a9e6edb5f524156c569cd8a9a69"
    search_string = params[:query]
    results = RestClient.get(api_endpoint + "&query=#{search_string}")
    movies = JSON.parse(results.body)
    
    if movies["results"].empty?
      render json: { message: "No results found" }, status: 404
    else
      render json: { results: movies["results"] }
    end
  end
end
