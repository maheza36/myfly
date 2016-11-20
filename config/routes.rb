Rails.application.routes.draw do
  root to: 'static_pages#welcome'
  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations',
          passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cities
  resources :airports
end
