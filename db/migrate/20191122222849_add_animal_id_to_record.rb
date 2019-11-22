class AddAnimalIdToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :animal_id, :integer
  end
end
