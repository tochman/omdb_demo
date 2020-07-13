RSpec.describe 'GET /api/v0/movies', type: :request do

  it 'is expected to return a collection of movies in an array' do
    get '/api/v0/movies'
    expect(JSON.parse(response.body)['Search']).to be_an Array
  end
end