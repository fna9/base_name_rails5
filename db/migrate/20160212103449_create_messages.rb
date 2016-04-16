class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :header
      t.text :text
      t.references :talk, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
