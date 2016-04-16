class CreateTalkUsers < ActiveRecord::Migration
  def change
    create_table :talk_users do |t|
      t.references :user1, index: true
      t.references :user2, index: true
      t.references :talk, index: true, foreign_key: true
	  t.foreign_key :users, column: :user1_id
	  t.foreign_key :users, column: :user2_id

      t.timestamps null: false
    end
  end
end
