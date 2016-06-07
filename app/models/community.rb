class Community < ApplicationRecord
  has_many :community_users
  has_many :community_pages, inverse_of: :community
  
  def get_main_page(user)
    if self.is_editor?(user)
      self.community_pages.find{|s| s.ismain == 0}
    else
      self.community_pages.find{|s| s.ismain == 0 and s.visibility == true} 
    end
  end
  
  def get_common_pages(user)
    if self.is_editor?(user)
      self.community_pages.select{|s| s.ismain == 1}
    else
      self.community_pages.find{|s| s.ismain == 1 and s.visibility == true} 
    end
  end
  
  def get_news_pages(user)
    if self.is_editor?(user)
      self.community_pages.select{|s| s.ismain == 2}
    else
      self.community_pages.find{|s| s.ismain == 2 and s.visibility == true} 
    end
  end
  
  def is_editor?(user)
    self.community_users.find{|c| c.user_id == user.id}.present?
  end
  
end
