class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :edit]

  def index
    @users = User.all
  end

  def show
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Vitej " + @user.name + "!"
      redirect_to @user
    else
      render 'new'
    end
  end


  def update
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      unless current_user?(@user) || current_user.admin?
        flash[:error] = "Zde nemate pristup."
        redirect_to(root_path)
      end
    end

    def admin_user
      unless current_user.admin?
        flash[:error] = "Nemate opravneni."
        redirect_to(root_path)
      end
    end

end
