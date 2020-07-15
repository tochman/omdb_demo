FactoryBot.define do
  factory :watchlist_item do
    movie_db_id { 1 }
    title { 'Star Wars' }
    watchlist
  end
end
