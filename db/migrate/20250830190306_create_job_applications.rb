class CreateJobApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :job_applications do |t|
      t.integer :user_id
      t.date :application_date
      t.string :status
      t.integer :description_id
      t.datetime :interview_date

      t.timestamps
    end
  end
end
