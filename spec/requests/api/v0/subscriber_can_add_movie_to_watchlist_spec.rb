# frozen_string_literal: true

RSpec.describe 'POST /api/v0/watchlist_items', type: :request do
  let(:subscriber) { create(:user, subscriber: true) }
  let(:subscriber_credentials) { subscriber.create_new_auth_token }
  let(:subscriber_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(subscriber_credentials) }

  describe 'successfully as a subscriber' do
    before do
      post '/api/v0/watchlist_items',
           params: {
             movie_db_id: 11,
             title: 'Star Wars'
           },
           headers: subscriber_headers
    end

    it 'is expected to return a 200 response status' do
      expect(response.status).to eq 200
    end

    it 'is expected to return a success message' do
      expect(JSON.parse(response.body)['message']).to eq 'The movie was added to your watchlist'
    end
  end

  describe 'unsuccessfully ' do
    describe 'as a non subscriber' do
      let(:user) { create(:user, subscriber: false, email: 'user@mail.com') }
      let(:user_credentials) { user.create_new_auth_token }
      let(:user_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }

      before do
        post '/api/v0/watchlist_items',
             params: {
               movie_db_id: 11,
               title: 'Star Wars'
             },
             headers: user_headers
      end

      it 'returns 401 response status' do
        expect(response.status).to eq 401
      end

      it 'returns an error message' do
        expect(JSON.parse(response.body)['message']).to eq 'You need to become a subscriber fore you can add anything to your watchlist'
      end
    end
  end
end
