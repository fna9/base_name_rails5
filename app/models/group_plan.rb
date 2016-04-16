class GroupPlan < ActiveRecord::Base
	belongs_to :plan
	belongs_to :group
end
