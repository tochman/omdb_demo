class WatchlistItemPolicy < ApplicationPolicy

  def create?
    user.subscriber
  end
end
