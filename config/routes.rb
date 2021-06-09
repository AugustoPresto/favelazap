Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'news', to: 'pages#news'
  get 'profile', to: 'pages#profile'
  get 'my_news', to: 'pages#my_news'

  resources :articles, except: [:index]
  get 'my_articles', to: 'articles#my_articles'
  
  resources :facts, except: [:index, :show]
  get 'my_facts', to: 'facts#my_facts'
end
