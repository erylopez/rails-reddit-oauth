Rails.application.routes.draw do
  root "home#index"
  get "/oauth/reddit/callback", to: "reddit/oauth#callback"
end
