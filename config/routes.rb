Rails.application.routes.draw do
  root to: 'categories#index'

  concern :commentable do
    resources :comments, only: :create
  end

  resources :categories, concerns: [:commentable] do
    resources :posts, concerns: [:commentable], only: %i[new create update show destroy], shallow: true
  end
end
