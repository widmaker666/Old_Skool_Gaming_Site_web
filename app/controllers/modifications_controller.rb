class ModificationsController < ApplicationController
    
    def update
        @user = User.find(params[:id])
        @user.update(last_name: params[:last_name]) if params[:last_name] != ""
        @user.update(first_name: params[:first_name]) if params[:first_name] != ""
        @user.update(email: params[:email]) if params[:email] != ""
        @user.update(description: params[:description]) if params[:description] != ""
        redirect_to user_path(@user)
    end

end