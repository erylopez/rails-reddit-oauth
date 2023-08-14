class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  def self.from_reddit(uid:, username:, access_token:)
    User.find_or_create_by(uid: uid, provider: "reddit") do |user|
      user.username     = username
      user.access_token = access_token
      user.email        = username + "@reddit_oauth.com"
      user.password     = Devise.friendly_token[0, 20]
    end
  end
end
