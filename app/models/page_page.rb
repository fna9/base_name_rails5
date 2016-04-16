class PagePage < ActiveRecord::Base
 
  belongs_to :page1, class_name: 'Page', foreign_key: :page1_id, primary_key: :id
  belongs_to :page2, class_name: 'Page', foreign_key: :page2_id, primary_key: :id

end
