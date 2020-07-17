RSpec.describe 'POST /api/v0/auth/sign_in', type: :request do
describe 'succefully' do
  before do
    post '/api/v0/auth',
    params: {
      uid: '123456789',
      email: 'facebook_user@mail.com',
      provider: 'facebook'
    }
    @response_json = JSON.parse(response.body)
    end

    it 'is expected to return 200 response status' do
      expect(response.status).to eq 200
    end

    it 'is expected to return client_id' do
      expect(@response_json).to include 'client_id'
    end

    it 'is expected to return uid' do
      expect(@response_json['uid']).to eq '123456789'
    end

    it 'is expected to return expiry' do
          expect(@response_json).to include 'expiry'
    end

    it 'is expected to return auth token' do
          expect(@response_json).to include 'auth_token'
    end

  end
end