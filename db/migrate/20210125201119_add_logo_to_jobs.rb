class AddLogoToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :logo, :string
    add_column :jobs, :slug, :string
  end
end
