WcnhWeb::Application.routes.draw do
  devise_for :users

  root :to => "pages#homepage"
  
  get "pages" => "pages#index"
  get "recent_changes" => "pages#index"
  get "search" => "pages#index"
    
  get "pages/:name" => "pages#show", :as => "page"
  post "pages" => "admin/pages#create", :as => "pages"
  put "pages/:id" => "admin/pages#save", :as => "pages_save"
  
  namespace "admin" do
    get "pages" => "pages#index", :as => "pages"
    get "pages/:id/edit" => "pages#edit", :as => "pages_edit"
    get "pages/new" => "pages#new", :as => "pages_new"
    get "pages/:id/delete" => "pages#delete", :as => "pages_delete"
  end

  # Other static pages
  get "wanted" => "pages#wanted"
  get "rp" => "pages#rp"
  get "headlines" => "feeds#headlines"
  get "gmemits" => "feeds#gmemits"
  get "show_rss/:id" => "feeds#show"
  get "announcements" => "feeds#announcements"
  get "contracts" => "feeds#contracts"
  
  # Web API
  # Commented out for wcmush.com archiving
  #get 'api/:event' => "api#dispatch_handler" 

  # old site URLs
  match "/intro" => redirect("/pages/introduction")
  match "/faq" => redirect("/pages/faq")
  match "/play" => redirect("/pages/begin-playing")
  match "/systems" => redirect("/pages/inhabited-systems")
  match "/systems/cabrea" => redirect("/pages/cabrea-system")
  match "/systems/midgard" => redirect("/pages/midgard-system")
  match "/systems/pembroke" => redirect("/pages/pembroke-system")
  match "/systems/vespus" => redirect("/pages/vespus-system")
  match "/races/human" => redirect("/pages/humans")
  match "/races/kilrathi" => redirect("/pages/kilrathi")
  match "/orgs/esc" => redirect("/pages/enigma-sector-consortium")
  match "/orgs/esc/vsi" => redirect("/pages/von-sprechen-industries")
  match "/orgs/esc/gc" => redirect("/pages/guinterin-combine/")
  match "/orgs/esc/tr" => redirect("/pages/taffin-reclamation")
  match "/orgs/kc" => redirect("/pages/kilrathi-commonwealth")
  match "/origins" => redirect("/pages/origins")
  match "/recent" => redirect("/pages/recent-history")
  match "/arcs" => redirect("/pages/running-arcs")

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  #

end
