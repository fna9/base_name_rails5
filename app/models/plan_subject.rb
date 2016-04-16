class PlanSubject < ActiveRecord::Base
  belongs_to :plan
  belongs_to :subject
end
