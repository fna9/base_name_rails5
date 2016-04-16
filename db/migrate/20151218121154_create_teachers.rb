class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :last_name, :null => false, :limit => 64
      t.string :first_name, :null => false, :limit => 64
      t.string :second_name, :limit => 64
      t.string :degree, :null => false
      t.string :rank, :null => false
      t.string :position, :null => false
      t.date :b_date, :null => false 

      t.timestamps null: false
    end
  end
end
