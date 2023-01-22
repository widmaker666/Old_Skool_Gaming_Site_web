class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :price
      t.references :user, foreign_key: true
      t.string :stripetoken

      t.timestamps
    end
  end
end
