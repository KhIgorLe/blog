Rails.application.routes.draw do
  root to: 'categories#index'
  resources :categories do
    resources :posts, only: %i[new create update show destroy], shallow: true
  end
end
