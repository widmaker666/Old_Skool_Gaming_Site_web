class Linkcommentarticle < ActiveRecord::Migration[7.0]
  def change
    add_reference :thecomments, :user, foreign_key: true
    add_reference :thecomments, :article, foreign_key: true
  end
end
