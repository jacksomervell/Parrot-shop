class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :parrot
      t.string :quantity
      t.string :review

      t.timestamps null: false
    end
  end
end
