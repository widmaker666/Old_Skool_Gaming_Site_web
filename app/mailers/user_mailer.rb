class UserMailer < ApplicationMailer
   default from: 'hugopuillet@hotmail.fr'


   def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
         @user = user
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
         @url  =  "oldschoolgaming.fr"
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
         mail(to: @user.email, subject: 'Bienvenue chez nous !')
   end

   def  buy_email(order)
         #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
         @order = order
         @user = @order.user
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
         @url  = "oldschoolgaming.fr"
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
         mail(to: @user.email, subject: 'commande passée!')
   end

   def sell_email(order)
         #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
         tab = []
         @order = order
         @order.articles.each do |articles|
            tab << articles.seller
         end
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
         @url  = "oldschoolgaming.fr"
         tab.each do |user|
            @user = user
         mail(to: @user.email, subject: 'vente faite !')
         end
   end

end
