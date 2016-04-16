class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :code, :null => false, :unique => true
      t.string :title, :null => false
      t.float :level, :null => false
      t.string :form_of_study, :null => false
      t.date :training_period, :null => false
      

      t.timestamps null: false
    end
  end
end
