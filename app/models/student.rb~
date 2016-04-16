class Student < ActiveRecord::Base



	has_attached_file :avatar, styles: { :medium => "300x300>", :thumb => "100x100>" }

	has_many :marks

	

	has_many :group_students
	has_many :groups, through: :group_students

	has_many :group_plans, through: :groups
	
	belongs_to :user
	
	
	validates :last_name, presence: true, length: {maximum: 64}
	validates :first_name, presence: true, length: {maximum: 64}
	validates :b_date, presence: true
	validates :passport_series, presence: true, uniqueness: {scope: :passport_id}
	validates :passport_id, presence: true

	
        validates :avatar,
            attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
            attachment_size: { less_than: 1.megabytes },
            attachment_file_name: {:matches => [/png\Z/, /jpe?g\Z/]}
	
	validate :check_birthday

	def age(d=nil)
		d||=Date.today
		return unless b_date
		res=d.year-b_date.year
		res-= 1 if Date.new(d.year, b_date.month, b_date.day) > d
		res
	end
	
	def human_age(d=nil)
		"#{age(d)} #{RuPropisju.choose_plural(age(d), 'год', 'года', 'лет')}"
	end
	
	def full_name
	  "#{self.last_name} #{self.first_name[0..0]}." + (self.second_name.present? ? self.second_name[0..0] + '.' : '')
	end	
private

	def check_birthday
		errors.add(:b_date, :invalid) if b_date && b_date>Date.today
		true
	end
	

end
