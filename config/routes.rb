Rails.application.routes.draw do
  resources :phone_numbers
  resources :people
  #root to: 'bookmarks#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
