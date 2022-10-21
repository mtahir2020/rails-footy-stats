Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :clubs, only: [:show, :index] do
    resources :players, only: [:index, :show] do
      collection do
        get :top
      end
    end
  end
end
