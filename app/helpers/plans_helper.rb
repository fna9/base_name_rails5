module PlansHelper

  def type_of_reporting(number)
    Plan::FTYPES[number.to_i]
  end

end
