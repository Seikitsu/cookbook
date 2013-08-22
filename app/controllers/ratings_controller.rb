class RatingsController < ApplicationController 
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = current_user.ratings.create(rating_params)

    respond_to do |format|
      if @rating.save
        @ratingAvarage = @rating.post.averageRating

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