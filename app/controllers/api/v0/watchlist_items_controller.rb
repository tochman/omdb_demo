# frozen_string_literal: true

class Api::V0::WatchlistItemsController < ApplicationController
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def create
    authorize(WatchlistItem.create)
    current_user.watchlist.watchlist_items.create(title: params['title'], movie_db_id: params['movie_db_id'])
    render json: { message: 'The movie was added to your watchlist' }
  end

  private

  def user_not_authorized
    render json: { message: "You need to become a subscriber before you can add anything to your watchlist" }, status: 401
  end
end
