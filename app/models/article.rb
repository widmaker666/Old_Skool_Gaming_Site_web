class Article < ApplicationRecord
  validates :title, length: {maximum: 30, too_long: "%{count} caractère autorisés pour le titre" }, presence: true
  validates :content, length: { maximum: 250,
    too_long: "%{count} caractère autorisés pour la description" }, presence: true
  validates :price, :console, :typeofgame, presence: true
  validates :price, numericality: { message: "%{value} semble incorrect" }

    
    enum :typeofgame, [:Mauvais_état, :Bon_état, :Très_bon_état, :Neuf]
    enum :console, [:SNES, :PS1, :SEGA]
    belongs_to :seller, class_name: "User"
    belongs_to :buyer, class_name: "User", optional: true
    has_many_attached :images
    has_many :article_carts
    has_many :carts, through: :article_carts
    has_many :article_orders
    has_many :orders, through: :article_orders
    has_many :comments, as: :commentable
    has_many :thecomments
end
