module SubjectsHelper
  def type_of_reporting(number)
    Subject::RTYPES[number.to_i]
  end

end
