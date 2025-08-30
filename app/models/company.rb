# == Schema Information
#
# Table name: companies
#
#  id                     :bigint           not null, primary key
#  job_descriptions_count :integer
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Company < ApplicationRecord
end
