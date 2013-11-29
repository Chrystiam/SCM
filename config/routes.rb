SCQ::Application.routes.draw do

  


  resources :estados


  #get 'quejas/asigna', to: 'quejas#asigna'
  match "/asigna" => "quejas#asigna"

  

  resources :asignacioncomites


  resources :coordinadores


  #get 'quejas/update_ficha', to: 'quejas#update_ficha'
   
  get "logout" => "sessions#destroy", :as => "logout"

  get "login" => "sessions#new", :as => "login"
  
  get "signup" => "users#new", :as => "signup"

  get "inicio/index"

  resources :users 

  resources :sessions

  resources :prioridades

  resources :usercomites

 match "/envio_email" => "comites#envio_email"
  
  resources :fcomites do
    resources :comites do
        
        resources :usercomites
     
    end
  end
  resources :quejas

  resources :quejas do
    #ruta para el metodo de descarga de las evidencias
    member do
      get :download
    end
  end
  
  resources :fichas

  resources :programas do
    resources :fichas
  end
  

  resources :centros do
    resources :programas
  end

  resources :funcionarios


  resources :instructores


  resources :actas

  resources :cargos
  
  resources :faltas

  resources :tipos_documentos
  
  
  resources :ayudas do
    member do
      get :download
    end
  end
  
  #ruta select de fichas
  #match "/update_fichas" => "quejas#update_fichas"

  #ruta select de programas
  #match "/update_programas" => "quejas#update_programas"

  root :to => 'inicio#index'
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
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
