module CommunityPagesHelper

  def ismain(number)
    CommunityPages::ISMAINVALUES[number.to_i]
  end

end
