class ChangeTrainingPeriodToPlans < ActiveRecord::Migration
  def change
  
  remove_column :plans, :training_period_start, :integer
  remove_column :plans, :training_period_finish, :integer
  add_column :plans, :training_period_start, :integer, null: false
  add_column :plans, :training_period_finish, :integer, null: false

  end
end
