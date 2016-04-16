class MessagerUser < ActiveRecord::Base
  belongs_to :message
  belongs_to :user
end
