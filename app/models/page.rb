class Page < ActiveRecord::Base


	has_many :page_subjects
	has_many :subjects, through: :page_subjects
	
	has_many :pagepage1, class_name: 'Pagepage', foreign_key: :page1_id, primary_key: :id
        has_many :pagepage2, class_name: 'PagePage', foreign_key: :page2_id, primary_key: :id
	

	
        validates :visibility, presence: true
        validates :header, presence: true
        validates :contents, presence: true
        validates :alias, presence: true
end
