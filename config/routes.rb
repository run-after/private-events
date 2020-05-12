Rails.application.routes.draw do


resources :users, only:[:new, :create, :show]
resources :events, only:[:new, :create, :show, :index]

get    'sessions/new'
get    'sessions/create'

get    'sign_in', to: 'sessions#new'
post   'sign_in', to: 'sessions#create'
delete 'sign_out', to: 'sessions#destroy'

root   'sessions#new'

end
