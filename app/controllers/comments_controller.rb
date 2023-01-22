class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    Comment.create(title: params[:title], content: params[:content], user: current_user, commentable_id: params[:commentable_id], commentable_type: params[:commentable_type])
    redirect_to article_path(@article)
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update

  end

  # DELETE /comments/1 or /comments/1.json
  def destroy

  end

end
