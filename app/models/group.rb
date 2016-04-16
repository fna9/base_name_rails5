class Group < ActiveRecord::Base

	has_many :group_plans
	has_many :plans, through: :group_plans
	
	has_many :group_students
	has_many :students, through: :group_students
	
	validates :title, presence: true
	validates :course, presence: true
	validates :semester, presence: true
end
