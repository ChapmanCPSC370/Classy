Rails.application.routes.draw do
  resources :completed_courses

  resources :degree_requirements

  resources :majors

  resources :enrollments

  resources :announcements

  resources :assignments
  resources :departments do
    resources :majors
  end
  resources :reviews

  resources :colusseums
  get 'sections/all_sections'
  get 'sections/edit_all'
  
  delete 'sections/destroy_multiple'

  resources :sections do
    resources :reviews
    resources :enrollments
    resources :assignments
    resources :announcements
    resources :users
    get 'students'
  end
  

  resources :universities do
    resources :departments
    resources :majors
  end

   as :user do
    get '/register', to: 'devise/registrations#new', as: :register
    get '/login', to: 'devise/sessions#new', as: :login
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end

  devise_for :users, skip: [:sessions]

  as :user do
    get "/login" => 'devise/sessions#new', as: :new_user_session
    post "/login" => 'devise/sessions#create', as: :user_session
    delete "/logout" => 'devise/sessions#destroy', as: :destroy_user_session
  end

  devise_for :users, skip: [:sessions] do
    members do
      patch :edit
    end
  end
  
  get 'static_pages/home'
  get 'courses/all_courses'
  get 'courses/edit_all'
  
  delete 'courses/destroy_multiple'
  get 'static_pages/about'
  root 'static_pages#home'
  
  resource :devise
  resources :posts do
    resources :users 
  end
  resources :universities do
    resources :courses do
      resources :posts
      post "course/new"
    end
  end
  resources :courses do
    
    get 'alli'
    resources :sections do
      resources :enrollments
    end
    resources :posts do
      resources :users
    end
   # post "course/new"
  end
  
 # post "course/create"
  
  resources :users do
    resources :enrollments
    
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
