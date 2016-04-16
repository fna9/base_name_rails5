class RoleUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  
  def is_admin?
    return self.role.short_name == 'Админ' 
  end
  
  def is_student?
    return self.role.short_name == 'Студент' 
  end
  
  def is_teacher?
    return self.role.short_name == 'Преподаватель' 
  end
  
end
