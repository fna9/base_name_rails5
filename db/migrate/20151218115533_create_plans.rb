class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :code, :null => false, :unique => true
      t.string :title, :null => false
      t.float :level, :null => false
      t.integer :form_of_study, :null => false
      t.date :training_period_start, :null => false
      t.date :training_period_finish, :null => false
      t.references :university, index: true, :null => false

      t.timestamps null: false
    end
  end
end
