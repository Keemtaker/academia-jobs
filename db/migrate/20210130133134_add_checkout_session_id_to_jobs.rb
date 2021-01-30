class AddCheckoutSessionIdToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :checkout_session_id, :string
    add_column :jobs, :payment_completed, :boolean, default: false
  end
end
