class CreateMessagerUsers < ActiveRecord::Migration
  def change
    create_table :messager_users do |t|
      t.references :message, index: true
      t.references :user, index: true
	  t.foreign_key :messages
	  t.foreign_key :users

      t.timestamps null: false
    end
  end
end
