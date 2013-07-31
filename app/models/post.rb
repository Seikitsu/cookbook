class Post < ActiveRecord::Base
	attr_accessible :heading
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :content, presence: true
	validates :heading, presence: true
end
