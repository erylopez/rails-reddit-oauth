module ApplicationHelper
  def reddit_oauth_url
    base_url = Rails.env.production? ? "https://prod.com" : "http://localhost:3000"
    client_id = Rails.application.credentials.reddit[:client_id]
    redirect_uri = CGI.escape("#{base_url}/oauth/reddit/callback")
    scope = CGI.escape("identity")
    state = SecureRandom.hex(10)

    "https://www.reddit.com/api/v1/authorize?client_id=#{client_id}&response_type=code&state=#{state}&redirect_uri=#{redirect_uri}&duration=permanent&scope=#{scope}"
  end
end
