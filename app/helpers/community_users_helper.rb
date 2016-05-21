module CommunityUsersHelper

  def typeuser(number)
    CommunityUser::TYPEUSER[number.to_i]
  end


end
