Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :menu_items, except: :show
  end
end
