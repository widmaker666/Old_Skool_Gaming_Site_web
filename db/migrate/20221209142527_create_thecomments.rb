class CreateThecomments < ActiveRecord::Migration[7.0]
  def change
    create_table :thecomments do |t|
      t.text :text
      t.text :title

      t.timestamps
    end
  end
end
