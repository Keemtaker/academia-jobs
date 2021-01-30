class AddJobFieldToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :job_field, :string
  end
end
