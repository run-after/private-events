Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
resources :users#, only:[:new, :create, :show]

get 'sign_in', to: 'sessions#new'
post 'sign_in', to: 'sessions#create'
delete 'sign_out', to: 'sessions#destroy'

root 'sessions#new'

end
