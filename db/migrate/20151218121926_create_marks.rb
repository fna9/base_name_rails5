class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :mark, :null => false
      t.text :comment
      t.references :rating, index: true, :null => false
      t.references :student, index: true, :null => false

      t.timestamps null: false
    end
  end
end
