Rails.application.routes.draw do
  root 'static_pages#Home'
  get 'static_pages/Home'
  get 'static_pages/Help'
  get 'static_pages/About'
  get 'static_pages/Contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
