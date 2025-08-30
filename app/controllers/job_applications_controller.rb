class JobApplicationsController < ApplicationController
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

  def create
    the_job_application = JobApplication.new
    the_job_application.user_id = params.fetch("query_user_id")
    the_job_application.application_date = params.fetch("query_application_date")
    the_job_application.status = params.fetch("query_status")
    the_job_application.description_id = params.fetch("query_description_id")
    the_job_application.interview_date = params.fetch("query_interview_date")

    if the_job_application.valid?
      the_job_application.save
      redirect_to("/job_applications", { :notice => "Job application created successfully." })
    else
      redirect_to("/job_applications", { :alert => the_job_application.errors.full_messages.to_sentence })
    end
  end

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
