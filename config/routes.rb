Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'news', to: 'pages#news'
  get 'profile', to: 'pages#profile'
  get 'my_news', to: 'pages#my_news'

  resources :articles, except: [:index] do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
  put  'articles/:id/likes', to: 'articles#likes', as: "likes"
  
  resources :facts, except: [:index, :show]
end
