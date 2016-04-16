class CreateGroupStudents < ActiveRecord::Migration
  def change
    create_table :group_students do |t|
      t.references :group, index: true
      t.references :student, index: true
	t.foreign_key :groups
	t.foreign_key :students

      t.timestamps null: false
    end
  end
end
