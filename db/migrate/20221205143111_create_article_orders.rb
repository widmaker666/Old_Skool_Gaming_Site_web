class CreateArticleOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :article_orders do |t|
      t.references :article, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
