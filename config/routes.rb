Rails.application.routes.draw do
  get 'user_browser/index'

  resources :monthly_self_examinations
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "home#index"
  get "student/:id/index" => "monthly_self_examinations#student_index", as: "student_index"
  get "teacher/:id/menu" => "students#menu", as: "student_menu"

  get "role_manager/index" => "role_manager#index", as: "role_manager"
  get "role_manager/:id/edit" => "role_manager#edit", as: "edit_role_manager"
  patch "role_manager/index/:id/:role" => "role_manager#update_role", as: "role_manager_update_role"

  get "links_manager/index" => "links_manager#index", as: "links_manager"
  get "links_manager/:id/edit_teacher" => "links_manager#edit_teacher", as: "links_manager_edit_teacher"
  patch "links_manager/index/:id/:teacher_id/update_teacher" => "links_manager#update_teacher", as: "links_manager_update_teacher"

  get "links_manager/:id/edit_tutor" => "links_manager#edit_tutor", as: "links_manager_edit_tutor"
  patch "links_manager/index/:id/:tutor_id/update_tutor" => "links_manager#update_tutor", as: "links_manager_update_tutor"


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
