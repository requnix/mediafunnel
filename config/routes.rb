Mediafunnel::Application.routes.draw do
  resources :users do
    collection do
      post :sign_in
      get :sign_out
    end
  end

  resources :shows do
    resources :episodes
  end
  resources :releases
  resources :subscriptions

  match 'feed/user/:id'   => 'feeds#user_feed', via: :get, as: :user_feed
  match 'feed/show/:slug' => 'feeds#show_feed', via: :get, as: :show_feed

  root 'application#landing'
end
