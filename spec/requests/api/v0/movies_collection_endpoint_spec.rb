RSpec.describe 'GET /api/v0/movies', type: :request do
  describe 'successfully' do
    before do
      get '/api/v0/movies', 
      params: { 
        query: 'Star wars'
      }
  
      @response_json = JSON.parse(response.body)
    end
  
    it 'is expected to return a collection of movies in an array' do
      expect(@response_json["results"]).to be_an Array
    end 
  
    it 'is expected to return the first SW movie' do
      expect(@response_json["results"].first["title"]).to eq "Star Wars"
    end
  
  end

  describe 'unsuccessfully with' do
    describe 'random string' do
      before do
        get '/api/v0/movies', 
        params: { 
          query: 'sdrhiugreljreajipvbavrsipjiafewpiub'
        }
    
        @response_json = JSON.parse(response.body)
      end

      it 'is expected to return a 404 status' do
        expect(response.status).to eq 404
      end 
    
      it 'is expected to return an error message' do
        expect(@response_json["message"]).to eq "No results found"
      end
    end
  end
end