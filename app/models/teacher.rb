class Teacher < ActiveRecord::Base


	has_many :subject_teachers
	has_many :subjects, through: :subject_teachers
	has_attached_file :avatar, styles: { :medium => "300x300>", :thumb => "100x100>" },
           :path => ":rails_root/system/:class/:attachment/:id_partition/:style/:filename"
           	
	belongs_to :user
	
	validates :last_name, presence: true, length: {maximum: 64}
	validates :first_name, presence: true, length: {maximum: 64}
	validates :second_name, presence: true, length: {maximum: 64}
	validates :degree, presence: true
	validates :rank, presence: true
	validates :position, presence: true
        validates :b_date, presence: true
	
	validate :check_b_date

        validates :avatar,
            attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
            attachment_size: { less_than: 1.megabytes },
            attachment_file_name: {:matches => [/png\Z/, /jpe?g\Z/]}
            
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
	  [self.last_name, self.first_name, self.second_name].select{ |x| x.present? }.join(' ')
	end
	
private

	def check_b_date
		errors.add(:b_date, :invalid) if b_date && b_date>Date.today
		true
	end
end
