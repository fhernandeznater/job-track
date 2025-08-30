# == Schema Information
#
# Table name: job_applications
#
#  id               :bigint           not null, primary key
#  application_date :date
#  interview_date   :datetime
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  description_id   :integer
#  user_id          :integer
#
class JobApplication < ApplicationRecord
end
