class OrdersController < ApplicationController
    def new
    end



    def create
        # Before the rescue, at the beginning of the method
      @user = current_user
      @stripe_amount = @user.cart.total
      begin
        customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
        })
        charge = Stripe::Charge.create({
          customer: customer.id,
          amount: @stripe_amount * 100,
          description: "Achat d'un produit",
          currency: 'eur',
        })
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_order_path
      end
      # After the rescue, if the payment succeeded
      Order.create(stripetoken: params[:stripeToken], price: @stripe_amount, user: @user)  # Création de la commande si le paiement est passé
      @user.cart.article_carts.each do |cart|
        ArticleOrder.create!(order: Order.last, article: cart.article)  # Permet d'associer tous les articles à la commande
        Article.find(cart.article.id).update(buyer: @user)  # Je met l'acheteur sur l'article histoire qu'ils ne puissent plus être acheté
        cart.destroy  # On supprimer le tampon entre le caddie et l'article
      end
      @user.cart.update(total: 0) # On pense bien à mettre le total du caddie à 0 !
      redirect_to new_order_path
    end
    
    def set_time
      @time = Time.now
    end
  
end