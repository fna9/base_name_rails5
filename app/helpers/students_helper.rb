module StudentsHelper
def select_group(name, selected = nil)
  select_tag(name, options_for_select(
    Group.order('title').load.map{|x| ["#{x.l_n} #{x.f_n[0]}.#{x.s_n[0]}.", x.id]},
    [selected]))
  end
end
