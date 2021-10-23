class CreateForumTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :forum_topics do |t|
      t.string :name
      t.belongs_to :forum_subcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
