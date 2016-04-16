class Afile < ActiveRecord::Base

	has_many :afile_messagers
	has_many :messages, through: :afile_messagers
	
	has_attached_file :file

end
