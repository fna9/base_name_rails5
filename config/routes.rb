Rails.application.routes.draw do
  resources :role_users
  resources :roles
  resources :universities
  resources :messages
  resources :afile_messagers
  resources :messager_users
  resources :group_students
  resources :afile_massagers
  resources :subject_teachers
  resources :plan_subjects
  resources :page_subjects
  resources :page_pages
  resources :talk_users
  resources :group_plans
  resources :talks
  resources :afiles
  resources :pages
  resources :ratings
  resources :subjects
  resources :marks
  resources :students
  resources :groups
  resources :teachers
  resources :students do
    member do
      get :get_photo
      get :show_photo
    end
  end
  resources :users
  resources :plans
  resources :password_resets

  get 'welcome/index', as: :welcome
  get 'login' => 'welcome#new', :as => :login
  get 'logout' => 'welcome#destroy', :as => :logout
  post 'try_login' => 'welcome#create', :as => :try_login
  root 'welcome#index'

  resources :users do
    member do
      get :activate
    end
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
