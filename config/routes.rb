Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
      registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # defaults to dashboard
  root to: redirect('/home')

  # view routes
  get '/home' => 'home#index'
  get '/home/xat', to: 'home#xat'

  # api routes
  get '/api/i18n/:locale' => 'api#i18n'

end
