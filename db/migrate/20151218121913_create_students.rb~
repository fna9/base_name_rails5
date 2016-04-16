class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :last_name, :null => false, :limit => 64
      t.string :first_name, :null => false, :limit => 64
      t.string :second_name, :limit => 64
      t.date :b_date, :null => false
      t.string :passport_id, :null => false
      t.integer :passport_series, :null => false 
      t.index [:passport_id, :passport_series], :unique => true
      

      t.timestamps null: false
    end
  end
end
