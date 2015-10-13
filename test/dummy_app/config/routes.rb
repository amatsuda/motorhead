Rails.application.routes.draw do
  resource :greeting, controller: 'greeting', only: :show
end
