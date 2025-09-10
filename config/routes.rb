Rails.application.routes.draw do


root "pages#root"


  # Routes for the Company resource:

  # CREATE
  post("/insert_company", { :controller => "companies", :action => "create" })

  # READ
  get("/companies", { :controller => "companies", :action => "index" })

  get("/companies/:path_id", { :controller => "companies", :action => "show" })

  # UPDATE

  post("/modify_company/:path_id", { :controller => "companies", :action => "update" })

  # DELETE
  get("/delete_company/:path_id", { :controller => "companies", :action => "destroy" })

  #------------------------------

  # Routes for the Job description resource:

  # CREATE
  post("/insert_job_description", { :controller => "job_descriptions", :action => "create" })

  # READ
  get("/job_descriptions", { :controller => "job_descriptions", :action => "index" })

  get("/job_descriptions/:path_id", { :controller => "job_descriptions", :action => "show" })

  # UPDATE

  post("/modify_job_description/:path_id", { :controller => "job_descriptions", :action => "update" })

  # DELETE
  get("/delete_job_description/:path_id", { :controller => "job_descriptions", :action => "destroy" })

  #------------------------------

  # Routes for the Job application resource:

  get("/job_applications/new", { :controller => "job_applications", :action=> "new" })

  # CREATE
  post("/insert_job_application", { :controller => "job_applications", :action => "create" })

  # READ
  get("/job_applications", { :controller => "job_applications", :action => "index" })

  get("/job_applications/:path_id", { :controller => "job_applications", :action => "show" })

  # UPDATE

  post("/modify_job_application/:path_id", { :controller => "job_applications", :action => "update" })

  # DELETE
  get("/delete_job_application/:path_id", { :controller => "job_applications", :action => "destroy" })

  #------------------------------

  devise_for :users
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:
  # get("/your_first_screen", { :controller => "pages", :action => "first" })
end
