# == Schema Information
#
# Table name: job_descriptions
#
#  id         :bigint           not null, primary key
#  category   :string
#  job_title  :string
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#
class JobDescription < ApplicationRecord
  has_many  :job_applications, class_name: "JobApplication", foreign_key: "description_id", dependent: :destroy
  belongs_to :company, required: true, class_name: "Company", foreign_key: "company_id", counter_cache: true
end
