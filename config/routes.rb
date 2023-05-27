Rails.application.routes.draw do
  resource :users, only: [:new, :create]
  get 'top', to: 'static_pages#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
