Rails.application.routes.draw do

	resources :users

	match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'contact' => 'static_pages#contact'

  root 'static_pages#index'

end
