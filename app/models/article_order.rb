class ArticleOrder < ApplicationRecord
    belongs_to :article
    belongs_to :order
end
