Rails.application.routes.draw do
  resources :favorites, only: %i[create destroy]
  root to: 'posts#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :users,  only: [:new, :create, :show, :edit, :update, :destroy]
end
