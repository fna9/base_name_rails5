class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.text :name, null: false
      t.text :full_name, null: false
      t.index :name, unique: true

      t.timestamps null: false
    end
  end
end
