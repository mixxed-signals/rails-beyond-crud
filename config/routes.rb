Rails.application.routes.draw do
  resources :restaurants do
    # add additional routes that relate to restaurants
    resources :reviews, only: [:new, :create]
    # add route /restaurants/:restaurant_id/reviews/...

    collection do
      # collection routes: creates /restaurants/word
      # custom index -> MANY
      get "top" # or get :top
    end

    member do
      # member routes: creates /restaurants/:id/word
      # custom show -> ONE
      get :chef
    end

  end
  # get "restaurants/top", to: "restaurants#top"
  # get "restaurants/:id/chef", to: "restaurants#chef"
end
