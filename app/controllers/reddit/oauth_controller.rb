class Reddit::OauthController < ApplicationController
  def callback
    response = Reddit::GetAccessToken.new(
      code: params[:code],
      redirect_uri: "http://localhost:3000/oauth/reddit/callback"
    ).call

    if response.code == 200
      user_response = Reddit::GetUserInfo.new(access_token: response["access_token"]).call

      user = User.from_reddit(uid: user_response[:uid],
        username: user_response[:username],
        access_token: user_response[:access_token])

      bypass_sign_in user

      redirect_to root_path, notice: "Signed in with Reddit!"
    else
      redirect_to root_path, alert: "Something went wrong"
    end
  end
end
