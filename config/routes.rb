Rails.application.routes.draw do

	match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]

  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'contact' => 'static_pages#contact'

  root 'static_pages#index'

end
