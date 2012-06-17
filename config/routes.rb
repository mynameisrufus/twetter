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

    match '/direct_messages' => 'direct_messages#index'
    match '/direct_messages/sent' => 'direct_messages#sent'
    match '/favorites' => 'favorites#index'

    match '/account/settings' => 'account#settings'
    match '/account/picture' => 'account#picture'

    root to: 'statuses#friends_timeline'
  end

  match '/search' => 'statuses#search'

  match '/:username/status/:id' => 'statuses#show', as: 'user_status', constraints: {username: /[^\/]+/}
  match '/:username' => 'users#show', as: 'user', constraints: {username: /[^\/]+/}

  match '/conversations/:id' => 'conversations#related'
end
