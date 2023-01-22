class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @articles = @article.seller.my_articles
    @artcart = ArticleCart.all
    @artcartuser = @artcart.where(article_id: @article.id, cart_id: current_user.cart.id)[0]
    puts @artcartuser.class
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    art = params[:article]
    @article = Article.new(title: art[:title], content: art[:content], price: art[:price], typeofgame: art[:typeofgame], console: art[:console])
    @article.seller = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article créé avec succès" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article = Article.find(params[:id])
    @article.update!(title: params[:title]) if params[:title] != ""
    @article.update!(content: params[:description]) if params[:description] != ""
    @article.update!(price: params[:price]) if params[:price] != ""
    redirect_to article_path(@article)
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article supprimé avec succès" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :price)
    end
end
