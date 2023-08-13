class Reddit::OauthController < ApplicationController
  def callback
    response = Reddit::GetAccessToken.new(
      code: params[:code],
      redirect_uri: "http://localhost:3000/oauth/reddit/callback"
    ).call

    if response.code == 200
      redirect_to root_path, notice: "We have the access_token YAY!!"
    else
      redirect_to root_path, alert: "Something went wrong"
    end
  end
end
