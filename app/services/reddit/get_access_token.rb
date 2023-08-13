class Reddit::GetAccessToken < Reddit::Base
  def initialize(code:, redirect_uri:)
    super()
    @code = code
    @redirect_uri = redirect_uri
  end

  def call
    HTTParty.post("https://www.reddit.com/api/v1/access_token",
      body: "grant_type=authorization_code&code=#{@code}&redirect_uri=#{@redirect_uri}&duration=permanent",
      basic_auth: {username: @client_id, password: @client_secret},
      headers: {
        "User-Agent" => @user_agent
      })
  end
end
