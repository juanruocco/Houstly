Rails.application.routes.draw do

  resources :users do
    resources :places do
      resources :webcomponents do
        resources :imagedescriptions, :links
      end
    end
  end
  #resources :users #master
  #post '/place' => 'places#create'
  #get  '/place' => 'places#new'


  get  '/users' => 'users#index'

  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get  '/logout' => 'sessions#destroy'

  get  '/signup' => 'users#new'

  #get '/:id', to: 'welcome#index'  #master

  root 'welcome#index'



  #post '/tours' => 'tours#create'
  #get  '/tours' => 'tours#new'

  #post '/rooms' => 'rooms#create'
  #get  '/rooms' => 'rooms#new'
  #
  # post '/activities' => 'activities#create'
  # get  '/activities' => 'activities#new'
  #
  # post '/common_areas' => 'common_areas#create'
  # get  '/common_areas' => 'common_areas#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
