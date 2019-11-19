class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :sex
      t.integer :sire_id
      t.integer :dam_id
      t.integer :breed_id

      t.timestamps
    end
  end
end
