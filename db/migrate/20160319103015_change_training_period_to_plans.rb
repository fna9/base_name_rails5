class ChangeTrainingPeriodToPlans < ActiveRecord::Migration
  def change
  
  remove_column :plans, :training_period, :integer
  add_column :plans, :training_period, :integer, null: false

  end
end
