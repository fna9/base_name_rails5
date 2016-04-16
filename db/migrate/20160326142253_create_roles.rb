class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.text :name, null: false
      t.string :short_name, null: false
      t.index [:short_name], unique: true

      t.timestamps null: false
    end
  end
end
