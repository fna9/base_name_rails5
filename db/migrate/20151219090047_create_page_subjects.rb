class CreatePageSubjects < ActiveRecord::Migration
  def change
	create_table :page_subjects do |t|
			t.references :page, index: true
			t.references :subject, index: true
			t.foreign_key :pages
			t.foreign_key :subjects
	
		t.timestamps null: false
    end
  end
end
