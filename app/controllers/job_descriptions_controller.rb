class JobDescriptionsController < ApplicationController
  def index
    matching_job_descriptions = JobDescription.all

    @list_of_job_descriptions = matching_job_descriptions.order({ :created_at => :desc })

    render({ :template => "job_description_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_job_descriptions = JobDescription.where({ :id => the_id })

    @the_job_description = matching_job_descriptions.at(0)

    render({ :template => "job_description_templates/show" })
  end

  def create
    the_job_description = JobDescription.new
    the_job_description.start_date = params.fetch("query_start_date")
    the_job_description.job_title = params.fetch("query_job_title")
    the_job_description.company_id = params.fetch("query_company_id")
    the_job_description.category = params.fetch("query_category")

    if the_job_description.valid?
      the_job_description.save
      redirect_to("/job_descriptions", { :notice => "Job description created successfully." })
    else
      redirect_to("/job_descriptions", { :alert => the_job_description.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job_description = JobDescription.where({ :id => the_id }).at(0)

    the_job_description.start_date = params.fetch("query_start_date")
    the_job_description.job_title = params.fetch("query_job_title")
    the_job_description.company_id = params.fetch("query_company_id")
    the_job_description.category = params.fetch("query_category")

    if the_job_description.valid?
      the_job_description.save
      redirect_to("/job_descriptions/#{the_job_description.id}", { :notice => "Job description updated successfully." } )
    else
      redirect_to("/job_descriptions/#{the_job_description.id}", { :alert => the_job_description.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job_description = JobDescription.where({ :id => the_id }).at(0)

    the_job_description.destroy

    redirect_to("/job_descriptions", { :notice => "Job description deleted successfully." } )
  end
end
