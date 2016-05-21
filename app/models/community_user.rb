class CommunityUser < ApplicationRecord
  belongs_to :user
  belongs_to :community
  
  TYPEUSER = {0 => "Модератор", 1 => "Редактор", 2 => "Читатель"}
  validates :ismain, inclusion: {in: TYPEUSER.keys}
end
