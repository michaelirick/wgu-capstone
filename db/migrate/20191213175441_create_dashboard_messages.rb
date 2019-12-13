class CreateDashboardMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :dashboard_messages do |t|
      t.string :message
      t.integer :priority

      t.timestamps
    end
  end
end
