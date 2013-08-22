module RatingsHelper
	def has_rated?(post)
		return Rating.find_by(post: post, user: current_user)
	end
end