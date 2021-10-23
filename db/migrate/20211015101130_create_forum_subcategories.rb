class CreateForumSubcategories < ActiveRecord::Migration[6.1]
  def change
    create_table :forum_subcategories do |t|
      t.string :name
      t.belongs_to :forum_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
