SimpleController::Engine.routes.draw do
  resources :posts, only: :index
end
