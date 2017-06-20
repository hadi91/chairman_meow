class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_carts do |t|
      t.references :user, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
