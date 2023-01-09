Rails.application.routes.draw do

  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'my_room/index'
    get 'access_room/index'
    get 'access_room/:id/access', to: 'access_room#access'
    post '/room_verify/:id', to: 'access_room#room_verify', as: 'room_verify'
    get 'welcome/index'
    get 'search', to: 'search#questions'
    resources :my_room
  end
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    get 'search', to: 'search#questions'
    get  '/rooms/activities_list', to: 'rooms#activities_list'
    get  '/rooms/:room_id/activity_new', to: 'rooms#activity_new'

    resources :admins #Admins
    resources :subjects #Assuntos
    resources :questions #Perguntas
    resources :rooms #Salas Virtuais
    resources :activities #atividades
  end
  devise_for :users
  devise_for :admins

  root to: 'site/welcome#index'
  get 'inicio', to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
