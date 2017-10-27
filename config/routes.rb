Rails.application.routes.draw do





  get 'commonarea/index'

  get 'commonarea/create'

  get 'commonarea/update'

  get 'activities/index'

  get 'activities/create'

  get 'activities/update'

  resources :rooms, :tours, :places

  get '/:id', to: 'welcome#index'

  root 'welcome#index'

  post '/tours' => 'tours#create'
  get  '/tours' => 'tours#new'

  post '/rooms' => 'rooms#create'
  get  '/rooms' => 'rooms#new'

  post '/place' => 'places#create'
  get  '/place' => 'places#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
