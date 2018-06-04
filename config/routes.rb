Rails.application.routes.draw do
  # Routes for the Ecommerce review resource:

  # CREATE
  get("/ecommerce_reviews/new", { :controller => "ecommerce_reviews", :action => "new_form" })
  post("/create_ecommerce_review", { :controller => "ecommerce_reviews", :action => "create_row" })

  # READ
  get("/ecommerce_reviews", { :controller => "ecommerce_reviews", :action => "index" })
  get("/ecommerce_reviews/:id_to_display", { :controller => "ecommerce_reviews", :action => "show" })

  # UPDATE
  get("/ecommerce_reviews/:prefill_with_id/edit", { :controller => "ecommerce_reviews", :action => "edit_form" })
  post("/update_ecommerce_review/:id_to_modify", { :controller => "ecommerce_reviews", :action => "update_row" })

  # DELETE
  get("/delete_ecommerce_review/:id_to_remove", { :controller => "ecommerce_reviews", :action => "destroy_row" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  get("/photos/new", { :controller => "photos", :action => "new_form" })
  post("/create_photo", { :controller => "photos", :action => "create_row" })

  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:id_to_display", { :controller => "photos", :action => "show" })

  # UPDATE
  get("/photos/:prefill_with_id/edit", { :controller => "photos", :action => "edit_form" })
  post("/update_photo/:id_to_modify", { :controller => "photos", :action => "update_row" })

  # DELETE
  get("/delete_photo/:id_to_remove", { :controller => "photos", :action => "destroy_row" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
