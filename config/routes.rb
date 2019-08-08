Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
  resources :ingredients, only: [:index, :show]
  resources :doses, only: [:show, :edit, :update, :destroy]
end
