class CommunityUser < ApplicationRecord
  belongs_to :user
  belongs_to :community
  
  TYPEUSER = {0 => "Модератор", 1 => "Редактор", 2 => "Читатель"}
  validates :typeuser, inclusion: {in: TYPEUSER.keys}
  
  def <=>(b) 
    if self.user.teacher.present?
      arow = [self.typeuser, 0, self.user.teacher.last_name, self.user.teacher.first_name, self.user.teacher.second_name]
    elsif self.user.student.present?
      arow = [self.typeuser, 1, self.user.student.last_name, self.user.student.first_name, self.user.student.second_name]
    else
      arow = [self.typeuser, 2, '', '', '']
    end
    if b.user.teacher.present?
      brow = [b.typeuser, 0, b.user.teacher.last_name, b.user.teacher.first_name, b.user.teacher.second_name]
    elsif b.user.student.present?
      brow = [b.typeuser, 1, b.user.student.last_name, b.user.student.first_name, b.user.student.second_name]
    else
      brow = [b.typeuser, 2, '', '', '']
    end
    arow <=> brow
  end
end
