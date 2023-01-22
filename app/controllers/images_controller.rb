class ImagesController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @article.images.attach(params[:images])
        redirect_to(article_path(@article))
    end

    def destroy
        @article = Article.find(params[:article_id])
        @image = ActiveStorage::Attachment.find(params[:id])
        @image.attachments[params[:task_id].to_i].purge
        redirect_to article_path(@article)
    end
  end
  