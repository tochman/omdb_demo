RSpec.describe "POST /api/v0/subscriptions", type: :request do
  describe 'successfully' do
    let(:user) { create(:user)}
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) { { HTTP_ACCEPT: 'application/json'}.merge!(user_credentials) }
  
    before do
      post "api/v0/subscriptions", 
        params: {
          stripeToken: "1234"
        },
        headers: user_headers
    end

    it "is expected to return 200 response status" do
      expect(response.status).to eq 200
    end

    it "is expected to return paid: true" do
      expect(JSON.parse(response.body)["paid"]).to eq true
    end

    it "is expected to return success message" do
      expect(JSON.parse(response.body)["message"]).to eq "Successfull payment, you are now a subscriber"
    end
  end
end
