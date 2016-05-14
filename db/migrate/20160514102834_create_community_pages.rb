class CreateCommunityPages < ActiveRecord::Migration[5.0]
  def change
    create_table :community_pages do |t|
      t.references :page, foreign_key: true
      t.references :community, foreign_key: true
      t.boolean :ismain

      t.timestamps
    end
  end
end
