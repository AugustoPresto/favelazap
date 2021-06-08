Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'news', to: 'pages#news'
  get 'profile', to: 'pages#profile'

  resources :articles, except: [:index] do
    resources :comments, only: :create
  end
  get 'my_articles', to: 'articles#my_articles'
  
  resources :facts, except: [:index, :show]
  get 'my_facts', to: 'facts#my_facts'
end
