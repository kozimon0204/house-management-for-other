class CreateExpendables < ActiveRecord::Migration[5.1]
  def change
    create_table :expendables do |t|
      t.belongs_to :category

      t.integer :display_number, default: 0
      t.integer :expendable_type, default: 0
      t.string :name

      t.string :img
      t.string :url
      t.integer :price, default: 0
      t.integer :requier_number, default: 0

      t.timestamps
    end
  end
end
