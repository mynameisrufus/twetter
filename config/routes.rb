Twetter::Application.routes.draw do

  match '/logout' => 'sessions#destroy', as: 'logout'
  match '/login' => 'sessions#new', as: 'login'
  resource :session

  match '/home' => 'statuses#friends_timeline'
  match '/replies' => 'statuses#replies'
  match '/friends' => 'statuses#friends'
  match '/followers' => 'statuses#followers'
  match '/search' => 'statuses#search'
  match '/statistics' => 'statuses#statistics'
  match '/public_timeline' => 'statuses#public_timeline'

  match '/statuses/public_timeline.:format' => 'statuses#friends_timeline'
  match '/status/update' => 'statuses#update'

  match '/:username/status/:id' => 'statuses#show', as: 'user_status'
  match '/:username' => 'user#show', as: 'user'

end
