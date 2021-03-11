Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes, only: [:index, :show] do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :bookings, only: [:create]
  end
  get 'mybookings', to: 'bookings#mybookings'
end
