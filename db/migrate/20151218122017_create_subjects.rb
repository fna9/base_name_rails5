class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title, :null => false
      t.string :s_type, :null => false
      t.integer :type_of_reporting, :null => false

      t.timestamps null: false
    end
  end
end
