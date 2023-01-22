class CreateArticleCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :article_carts do |t|
      t.references :article, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
