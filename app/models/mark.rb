class Mark < ActiveRecord::Base
	belongs_to :student
	belongs_to :rating 
	
	validates :mark, presence: true, { numericality: { greater_than: 0 } }
end
