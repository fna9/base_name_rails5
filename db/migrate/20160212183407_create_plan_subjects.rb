class CreatePlanSubjects < ActiveRecord::Migration
  def change
    create_table :plan_subjects do |t|
      t.references :plan, index: true
      t.references :subject, index: true
      t.foreign_key :plans
      t.foreign_key :subjects

      t.timestamps null: false
    end
  end
end
