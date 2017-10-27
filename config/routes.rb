Rails.application.routes.draw do
  get 'psygon/index'

  resources :rooms, :tours, :places, :users

  root 'welcome#index'

  get  '/psygon' => 'psygon#index'

  post '/tours' => 'tours#create'
  get  '/tours' => 'tours#new'

  post '/rooms' => 'rooms#create'
  get  '/rooms' => 'rooms#new'

  post '/place' => 'places#create'
  get  '/place' => 'places#new'

  get  '/users' => 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
