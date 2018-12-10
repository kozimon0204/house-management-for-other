class CreateHouseExpendables < ActiveRecord::Migration[5.1]
  def change
    create_table :house_expendables do |t|
      t.belongs_to :house
      t.belongs_to :expendable

      t.timestamps
    end
  end
end
