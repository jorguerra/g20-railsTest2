Rails.application.routes.draw do
  resources :todos
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'
  post 'completed/:todo', controller: 'tasks', action: 'completed', as: 'completed'
  delete 'uncompleted/:todo', controller: 'tasks', action: 'uncompleted', as: 'uncompleted'
end
