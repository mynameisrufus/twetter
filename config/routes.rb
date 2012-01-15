Twetter::Application.routes.draw do

  devise_for :users, sign_out_via: :get

  authenticate do
    match '/home' => 'statuses#friends_timeline'
    match '/replies' => 'statuses#replies'
    match '/friends' => 'statuses#friends'
    match '/followers' => 'statuses#followers'

    match '/statistics' => 'statuses#statistics'
    match '/public_timeline' => 'statuses#public_timeline'

    match '/statuses/public_timeline.:format' => 'statuses#friends_timeline'
    match '/status/update' => 'statuses#update'

    root to: 'statuses#friends_timeline'
  end

  match '/direct_messages' => 'direct_messages#index'
  match '/direct_messages/sent' => 'direct_messages#sent'
  match '/search' => 'statuses#search'
  match '/favorites' => 'favorites#index'

  match '/:username/status/:id' => 'statuses#show', as: 'user_status'
  match '/:username' => 'users#show', as: 'user'

end
