class CreateGroupPlans < ActiveRecord::Migration
  def change
    create_table :group_plans do |t|

	  t.references :group, :index => true
	  t.references :plan, :index => true
	  t.foreign_key :groups
	  t.foreign_key :plans

      t.timestamps null: false
    end
  end
end
