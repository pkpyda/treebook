class Status < ActiveRecord::Base
	attr_accessible :context, :user_id
	validates :context, presence: true, length: {minimum: 2}
	validates :user_id, presence: true
	belongs_to :user
end
