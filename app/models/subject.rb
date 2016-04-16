class Subject < ActiveRecord::Base

	has_many :ratings

	
	has_many :plan_subjects
	has_many :plans, through: :plan_subjects

	has_many :page_subjects
	has_many :pages, through: :page_subjects
	
	has_many :subject_teachers
	has_many :teachers, through: :subject_teachers
	
	validates :title, presence: true
	validates :s_type, presence: true
	validates :type_of_reporting, presence: true
	
	RTYPES = ['Экзамен', 'Дифференциальный зачет', 'Зачет']
end
