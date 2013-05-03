ResumeEdit::Application.routes.draw do
  resources :resume_feedbacks


  resources :resume_docs


  # The priority is based upon order of creation:
  # first created -> highest priority.

  match 'resume/convert' => 'resume#convert', :as => :resume_convert
  match 'resume/critique' => 'resume#critique', :as => :resume_critique
  match 'resume/provide_critique' => 'resume#provide_critique', :as => :provide_critique
  match 'same_origin_hook' => 'resume#same_origin_hook', :as => "same_origin_hook"
  
  match 'resume/ajax_set_safe_html' => 'resume_docs#ajax_set_safe_html', :as => "ajax_set_safe_html"
  match 'resume/ajax_add_note' => 'resume_docs#ajax_add_note', :as => "ajax_add_note"
  match 'resume/ajax_add_annotation' => 'resume_docs#ajax_add_annotation', :as => "ajax_add_annotation"
  

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
end
