class Rating < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	validates :post_id, presence: true
	validates :rating, presence: true
	validates :user_id, presence: true
end
