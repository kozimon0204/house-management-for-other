class CreateExpendableChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :expendable_choices do |t|
      t.belongs_to :house
      t.belongs_to :expendable

      t.integer :status, default: 0
      t.integer :amount, default: 1

      t.timestamps
    end
  end
end
