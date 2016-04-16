class AfileMessager < ActiveRecord::Base
  belongs_to :afile
  belongs_to :message
end
