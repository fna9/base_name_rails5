class Talk < ActiveRecord::Base
	has_many :messages, dependent: :destroy

	has_many :talk_users
	has_many :users, through: :talk_users

	validates :title, presence: true
end
