class ThecommentsController < ApplicationController
  before_action :set_thecomment, only: %i[ show edit update destroy ]

  # GET /thecomments or /thecomments.json
  def index
    @thecomments = Thecomment.all
  end

  # GET /thecomments/1 or /thecomments/1.json
  def show
  end

  # GET /thecomments/new
  def new
    @thecomment = Thecomment.new
  end

  # GET /thecomments/1/edit
  def edit
  end

  # POST /thecomments or /thecomments.json
  def create
    @thecomment = Thecomment.new
    @thecomment.title = params[:title]
    @thecomment.text = params[:text]
    @thecomment.user = current_user
    @thecomment.article_id = params[:article_id]

    respond_to do |format|
      if @thecomment.save
        format.html { redirect_to article_path(params[:article_id]), notice: "Thecomment was successfully created." }
        format.json { render :show, status: :created, location: @thecomment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @thecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thecomments/1 or /thecomments/1.json
  def update
    respond_to do |format|
      if @thecomment.update(thecomment_params)
        format.html { redirect_to thecomment_url(@thecomment), notice: "Thecomment was successfully updated." }
        format.json { render :show, status: :ok, location: @thecomment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @thecomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thecomments/1 or /thecomments/1.json
  def destroy
    @thecomment.destroy

    respond_to do |format|
      format.html { redirect_to thecomments_url, notice: "Thecomment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thecomment
      @thecomment = Thecomment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thecomment_params
      params.require(:thecomment).permit(:user_id, :text, :title)
    end
end
