class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :orderstatus, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
