class CreateBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :breeds do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
