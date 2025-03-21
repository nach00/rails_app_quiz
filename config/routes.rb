Rails.application.routes.draw do
  # Define the API endpoints for jobs
  post '/jobs', to: 'jobs#create'
  get '/jobs/:id', to: 'jobs#show'
  get '/jobs', to: 'jobs#index'
end
