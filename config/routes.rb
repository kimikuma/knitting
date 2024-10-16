Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get '/list'=>'homes#list'
  resources :users do
    resource :relationships
    get "followings"=>"relationships#followings",as: "followings"
    get "followers"=>"relationships#followers",as: "followers"
  end
  resources :posts do
    resources :comments
    resource :favorites
  end

  get "/search"=>"searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
