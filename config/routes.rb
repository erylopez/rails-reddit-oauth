Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "/oauth/reddit/callback", to: "reddit/oauth#callback"
end
