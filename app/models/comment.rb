class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :post_id, presence: true
	validates :content, presence: true
	validates :name, presence: true
end
