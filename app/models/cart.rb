class Cart < ApplicationRecord
    belongs_to :user
    has_many :article_carts
    has_many :articles, through: :article_carts
end
