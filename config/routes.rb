Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :contents, controller: 'compose/contents'
    resources :compose_contents, controller: 'compose/contents'
    resources :menus
  end
  constraints(Spree::StaticPage) do
    get '/(*path)', :to => 'compose/contents#show', :as => 'static'
  end
end