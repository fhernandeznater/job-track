class JobApplicationsController < ApplicationController
  
  def new
    @the_job_application = JobApplication.new
    authorize(@the_job_application)
  end

  def create
    form_data = params.fetch("job_application")


    # Company
    company_name = form_data.fetch("company_name")
    company = Company.where({ :name => company_name}).at(0)

    unless company
      company = Company.new
      company.name = company_name
      company.save
    end

    # Description
    job_title = form_data.fetch("job_title")
    category = form_data.fetch("category")
    start_date = form_data.fetch("start_date")
    matching_descriptions = JobDescription.where({
      :company_id => company.id,
      :job_title => job_title,
      :category => category,
      :start_date => start_date
    })
    description = matching_descriptions.at(0)

    unless description
      description = JobDescription.new
      desscription.company_id = company_id
      description.job_title = job_title
      description.category = category
      description.start_date = start_date
      description.save
    end

    @the_job_application = JobApplication.new
    @the_job_application.user_id = current_user.id
    @the_job_application.description_id = description.id
    @the_job_application.application_date = form_data.fetch("application_date")
    @the_job_application.status = form_data.fetch("status")
    @the_job_application.interview_date = form_data.fetch("interview_date", nil)

    authorize(@the_job_application)

    if @the_job_application.save
      redirect_to(root, { :notice=> "Job application was successfully created." })
    else
      render({ :template => "job_application_templates/new" })
    end

    return
  end
  
  def index
    matching_job_applications = JobApplication.all

    @list_of_job_applications = matching_job_applications.order({ :created_at => :desc })

    render({ :template => "job_application_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_job_applications = JobApplication.where({ :id => the_id })

    @the_job_application = matching_job_applications.at(0)

    render({ :template => "job_application_templates/show" })
  end

  # def create
  #   the_job_application = JobApplication.new
  #   the_job_application.user_id = params.fetch("query_user_id")
  #   the_job_application.application_date = params.fetch("query_application_date")
  #   the_job_application.status = params.fetch("query_status")
  #   the_job_application.description_id = params.fetch("query_description_id")
  #   the_job_application.interview_date = params.fetch("query_interview_date")

  #   if the_job_application.valid?
  #     the_job_application.save
  #     redirect_to("/job_applications", { :notice => "Job application created successfully." })
  #   else
  #     redirect_to("/job_applications", { :alert => the_job_application.errors.full_messages.to_sentence })
  #   end
  # end

  def update
    the_id = params.fetch("path_id")
    the_job_application = JobApplication.where({ :id => the_id }).at(0)

    the_job_application.user_id = params.fetch("query_user_id")
    the_job_application.application_date = params.fetch("query_application_date")
    the_job_application.status = params.fetch("query_status")
    the_job_application.description_id = params.fetch("query_description_id")
    the_job_application.interview_date = params.fetch("query_interview_date")

    if the_job_application.valid?
      the_job_application.save
      redirect_to("/job_applications/#{the_job_application.id}", { :notice => "Job application updated successfully." } )
    else
      redirect_to("/job_applications/#{the_job_application.id}", { :alert => the_job_application.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job_application = JobApplication.where({ :id => the_id }).at(0)

    the_job_application.destroy

    redirect_to("/job_applications", { :notice => "Job application deleted successfully." } )
  end
end
