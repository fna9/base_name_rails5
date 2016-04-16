class CreateAfileMessagers < ActiveRecord::Migration
  def change
    create_table :afile_messagers do |t|
      t.references :afile, index: true
      t.references :message, index: true
	  t.foreign_key :afiles
	  t.foreign_key :messages

      t.timestamps null: false
    end
  end
end
