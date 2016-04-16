class University < ActiveRecord::Base

	has_many :plans

	validates :name, presence: true
end
