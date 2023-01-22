class Order < ApplicationRecord
    after_create :order_mail_buy
    after_create :order_sell_buy

    belongs_to :user
    has_many :article_orders
    has_many :articles, through: :article_orders
    


    def order_mail_buy
        UserMailer.buy_email(self).deliver_now
    end

    def order_sell_buy
        UserMailer.sell_email(self).deliver_now
    end

end
