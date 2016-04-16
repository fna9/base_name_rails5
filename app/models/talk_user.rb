class TalkUser < ActiveRecord::Base
  belongs_to :talk

  belongs_to :user1, class_name: 'User', foreign_key: :user1_id, primary_key: :id
  belongs_to :user2, class_name: 'User', foreign_key: :user2_id, primary_key: :id

end
