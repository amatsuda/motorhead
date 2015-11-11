RoadCrew::Engine.routes.draw do
  resources :engine_settings, only: :index
  put 'engine_settings' => 'engine_settings#update_all'
end
