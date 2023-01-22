class User < ApplicationRecord
  after_create :welcome_send
  after_create :create_cart
  after_create :set_admin

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :my_articles, foreign_key: 'seller_id', class_name: "Article"
  has_many :my_purchases, foreign_key: 'buyer_id', class_name: "Article"
  has_one :cart
  has_many :comments
  has_many :orders
  has_many :thecomments


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def create_cart
    Cart.create(user: self, total: 0)
  end

  def set_admin

    if self.id == 1
    self.update(admin: true)
    end
  end
  
  
end
