class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.references :shopping_cart, foreign_key: true
      t.references :product, foreign_key: true, null: false
      t.references :order, foreign_key: true
      t.integer    :quantity, null: false, default: 0
      t.timestamps
    end
  end
end
