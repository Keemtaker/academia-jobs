class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :employer
      t.text :description
      t.string :email
      t.string :job_application_url
      t.string :address
      t.string :country
      t.string :city
      t.string :job_type
      t.string :continent
      t.string :application_deadline

      t.timestamps
    end
  end
end
