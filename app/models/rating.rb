class Rating < ActiveRecord::Base
	has_many :marks
	
	validates :title, presence: true
	validates :s_type, presence: true
	validates :offset, presence: true, numericality: {only_integer: true}
	validates :min_offset, presence: true, numericality: {only_integer: true}
	validates :max_offset, presence: true, numericality: {only_integer: true}
	validates :necessarily, presence: true
end
