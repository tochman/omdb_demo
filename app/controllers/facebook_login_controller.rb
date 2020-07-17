class FacebookLoginController < DeviseTokenAuth::RegistrationsController
  def create
    if params[:provider] == 'facebook'
      # create user with facebook credentials

      user = User.from_omniauth(params[:uid], params[:email], params[:provider])

      if user.persisted?
        sign_in user
        token = user.create_token
        user.save
        auth_params = {
          auth_token: token.token,
          client_id: token.client,
          uid: params[:uid],
          expiry: token.expiry
        }

        render json: auth_params
      else
        render json: { error: 'Authentication with Facebook failed'}, status: 401
      end
    else
      # create a user in the "normal" way with email and password 
      super # go through the normal flow in the devise registrations controller
    end
  end
end
