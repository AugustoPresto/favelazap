Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'news', to: 'pages#news'
  get 'profile', to: 'pages#profile'

  resources :articles, except: [:index]
  get 'my_articles', to: 'articles#my_articles'

  resources :facts, except: [:index, :show]
end
