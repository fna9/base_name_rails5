class PageSubject < ActiveRecord::Base
  belongs_to :page
  belongs_to :subject
end
