Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  get 'posts/library'
  resources :posts do 
    resources :comments
    member do
      put "like", to: "posts#upvote"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
