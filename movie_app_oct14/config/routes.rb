Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :movies, except: [:edit, :destroy] do
    resources :reviews, only: [:create, :destroy]
  end

end
