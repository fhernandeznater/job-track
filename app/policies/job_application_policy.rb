class JobApplicationPolicy < ApplicationPolicy
  # NOTE: Great job, love to see Pundit being implemented 
  attr_reader :user, :job_application

  def initialize(user, job_application)
    @user = user
    @job_application = job_application
  end

  def index?
    user.present?
  end

  def show?
    job_application.user_id == user&.id
  end

  def new?
    user.present?
  end
  alias create? new?

  def edit?
    job_application.user_id == user&.id
  end

  alias update? edit?

  alias destroy? edit?

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.present?
        scope.where({ :user_id => user.id})
      else
        scope.none
      end
    end
  end
end
