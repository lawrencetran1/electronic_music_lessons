Rails.application.routes.draw do

  root 'static_pages#index'

  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'contact' => 'static_pages#contact'

end
