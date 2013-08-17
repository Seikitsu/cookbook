class RatingsController < ApplicationController
  before_action :set_rating, only: [:show]
  before_action :check_rating, only: [:create, :update, :edit]

  def show
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = current_user.ratings.create(rating_params)
    respond_to do |format|
      if @rating.save
        format.html 
        format.js
      else
        flash[:error] = "Nastala chyba."
        redirect_to root_url
      end
    end
  end

  def update
  end

  def check_rating
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:rating, :user_id, :post_id)
    end
end