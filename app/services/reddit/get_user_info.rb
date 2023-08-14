class Reddit::GetUserInfo < Reddit::Base
  def initialize(access_token:)
    super()
    @access_token = access_token
  end

  def call
    response = HTTParty.get("https://oauth.reddit.com/api/v1/me", headers: {
      "Authorization" => "bearer #{@access_token}",
      "User-Agent" => @user_agent
    })

    return unless response.code == 200

    {
      uid: response["id"],
      username: response["name"],
      access_token: @access_token
    }
  end
end
