class Reddit::Base
  def initialize
    @client_id = Rails.application.credentials.reddit[:client_id]
    @client_secret = Rails.application.credentials.reddit[:client_secret]
    @client_name = Rails.application.credentials.reddit[:client_name]
    @user_agent = "web:railsoauth:0.0.1 (by /u/#{@client_name})"
  end
end
