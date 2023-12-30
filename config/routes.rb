Rails.application.routes.draw do
  resources :accesses
  resources :links
  devise_for :users
  get 'contact/index'
  get 'about_us/index'
  get "/l/:slug", to: "links#redirect", as: "redirect_link"
  get "/my_links", to: "links#my_links", as: "my_links"
  get "/input_password/:id", to: "links#input_password", as: "input_password"
  post 'links/verify_password/:id', to: 'links#verify_password', as: 'verify_password_link'
  post 'accesses/filtered_accesses', to: 'accesses#filtered_accesses', as: 'filtered_access'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "main#index"
end
