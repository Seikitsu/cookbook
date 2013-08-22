class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :ratings, dependent: :destroy
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :content, presence: true
	validates :heading, presence: true

	def averageRating
		rating = self.ratings.average('rating')
		return 0 unless rating 
		return rating.round(1)
	end
end
