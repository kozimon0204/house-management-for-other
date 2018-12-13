class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.integer :display_number, default: 0
      t.string :name

      t.string :img
      

      t.timestamps
    end
  end
end
