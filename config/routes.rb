Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants do
    # A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
    resources :reviews, only: %i[create]
  end
end
