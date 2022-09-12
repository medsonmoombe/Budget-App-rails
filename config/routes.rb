Rails.application.routes.draw do
  devise_for :users
  resources :user do
    resources :categories, only: %i[index new show create destroy] do
      resources :transactions, only: %i[index new show create destroy]
    end
  end
    root "categories#index"
end
