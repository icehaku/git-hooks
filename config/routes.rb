Rails.application.routes.draw do
  post '/webhook/github/', to: 'webhooks#github'
  get  '/webhook/github/', to: 'webhooks#github'

  jsonapi_resources :events
  jsonapi_resources :issues

  root to: "home#index"
end
