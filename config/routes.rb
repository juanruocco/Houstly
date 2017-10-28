Rails.application.routes.draw do
  resources :rooms, :tours, :places, :activities, :common_areas

  get '/:id', to: 'welcome#index'

  root 'welcome#index'

  post '/tours' => 'tours#create'
  get  '/tours' => 'tours#new'

  post '/rooms' => 'rooms#create'
  get  '/rooms' => 'rooms#new'

  post '/activities' => 'activities#create'
  get  '/activities' => 'activities#new'

  post '/common_areas' => 'common_areas#create'
  get  '/common_areas' => 'common_areas#new'

  post '/place' => 'places#create'
  get  '/place' => 'places#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
