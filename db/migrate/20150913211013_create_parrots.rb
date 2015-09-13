class CreateParrots < ActiveRecord::Migration
  def change
    create_table :parrots do |t|
      t.string :name
      t.string :type
      t.string :colour
      t.string :price

      t.timestamps null: false
    end
  end
end
