class CommunityPage < ApplicationRecord
  belongs_to :page, inverse_of: :community_pages
  belongs_to :community, inverse_of: :community_pages
  ISMAINVALUES = {0 => "Главная страница", 1 => "Обычная страница", 2 => "Новости"}
  validates :ismain, inclusion: {in: ISMAINVALUES.keys}
end
