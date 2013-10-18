Threepo::Application.routes.draw do
  devise_for :users

  root 'designs#index'

  resources :designs do
    resources :comments
  end
end
