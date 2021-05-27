Rails.application.routes.draw do
  resources :groups, only: %I[index new create show]
  resources :expenses, only: %I[index new create]
  resources :users, only: [:create]
  root 'welcome#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'external', to: 'expenses#external'
end
