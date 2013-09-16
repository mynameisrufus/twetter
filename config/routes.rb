Twetter::Application.routes.draw do
  devise_for :users, sign_out_via: :get

  authenticate do
    get '/home' => 'statuses#friends_timeline'
    get '/replies' => 'statuses#replies'
    get '/friends' => 'statuses#friends'
    get '/followers' => 'statuses#followers'

    get '/statistics' => 'statuses#statistics'
    get '/public_timeline' => 'statuses#public_timeline'

    get '/statuses/public_timeline.:format' => 'statuses#friends_timeline'
    post '/status/update' => 'statuses#update'

    get '/direct_messages' => 'direct_messages#index'
    get '/direct_messages/sent' => 'direct_messages#sent'
    get '/favorites' => 'favorites#index'

    get '/account/settings' => 'account#settings'
    patch '/account/settings' => 'account#settings'

    get '/account/picture' => 'account#picture'
    post '/account/picture' => 'account#picture'

    root to: 'statuses#friends_timeline'
  end

  get '/search' => 'statuses#search'

  get '/:username/status/:id' => 'statuses#show', as: 'user_status', constraints: {username: /[^\/]+/}
  get '/:username' => 'users#show', as: 'user', constraints: {username: /[^\/]+/}

  get '/conversations/:id' => 'conversations#related'
end
