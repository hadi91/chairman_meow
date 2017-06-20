class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :breed, null: false
      t.date :dob, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.integer :gender, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
