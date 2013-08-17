class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:destroy, :edit]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.create(comment_params)
    @comment.post = Post.find(params[:post_id])
    respond_to do |format|
      if @comment.save
        format.html 
        format.js 
        format.json
      else
        flash[:error] = "Nastala chyba."
        redirect_to root_url
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    flash[:success] = "Komentar smazan."
    @comment.destroy
    redirect_to @comment.post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :email, :content)
    end

    def correct_user
      unless current_user?(@comment.user) || current_user.admin?
        flash[:error] = "Nemate opravneni."
        redirect_to(root_path)
      end
    end
end
