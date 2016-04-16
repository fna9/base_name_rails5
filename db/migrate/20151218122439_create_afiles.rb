class CreateAfiles < ActiveRecord::Migration
  def change
    create_table :afiles do |t|
      t.text :description
      t.attachment :file
      
      t.timestamps null: false
    end
  end
end
