module SubjectsHelper
  def type_of_reporting(number)
    Subject::RTYPES[number.to_i]
  end

  def subject_options
    Subject.order(:title).all.map{|s| [s.title, s.id]}
  end
end
