class ArticleCart < ApplicationRecord
    belongs_to :article
    belongs_to :cart
    validates :article_id, uniqueness: { scope: :cart_id, message: "Cet article a déjà été ajouté au panier." }
end
