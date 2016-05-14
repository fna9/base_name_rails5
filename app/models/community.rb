class Community < ApplicationRecord
  has_many :community_users
  has_many :community_pages
  
  def get_main_page
    self.community_pages.find{|s| s.ismain}
  end
  
end
