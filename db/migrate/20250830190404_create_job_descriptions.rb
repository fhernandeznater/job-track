class CreateJobDescriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :job_descriptions do |t|
      t.date :start_date
      t.string :job_title
      t.integer :company_id
      t.string :category

      t.timestamps
    end
  end
end
