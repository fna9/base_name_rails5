class CreateSubjectTeachers < ActiveRecord::Migration
  def change
    create_table :subject_teachers do |t|
	t.references :subject, index: true
	t.references :teacher, index: true
	t.foreign_key :subjects
	t.foreign_key :teachers

      t.timestamps null: false
    end
  end
end
