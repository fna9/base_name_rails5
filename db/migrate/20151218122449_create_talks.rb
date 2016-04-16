class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title, :null => false
      t.timestamps null: false
    end
  end
end
