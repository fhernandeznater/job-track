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
end
