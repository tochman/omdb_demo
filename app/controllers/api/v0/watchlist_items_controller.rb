class Api::V0::WatchlistItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user.subscriber
      current_user.watchlist.watchlist_items.create(title: params["title"], movie_db_id: params["movie_db_id"])
  
      render json: { message: "The movie was added to your watchlist" }
    else
      render json: { message: "You need to become a subscriber before you can add anything to your watchlist" }, status: 401
    end
  end
end
