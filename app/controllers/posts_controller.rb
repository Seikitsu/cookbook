class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params) #Post.new(post_params)
    if @post.save
      flash[:success] = "Clanek vytvoren."
      redirect_to root_url
    else
      flash[:error] = "Nastala chyba."
      redirect_to root_url
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update_attributes(post_params)
      flash[:success] = "Clanek editovan."
      redirect_to root_url
    else
      render 'edit'
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    flash[:success] = "Clanek smazan."
    @post.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :heading)
    end

    def correct_user
      unless current_user?(@post.user) || current_user.admin?
        flash[:error] = "Nemate opravneni."
        redirect_to(root_path)
      end
    end
end
