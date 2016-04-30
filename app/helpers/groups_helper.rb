module GroupsHelper

  def group_options
    Group.order(:title).all.map{|g| [g.title, g.id]}
  end

end
