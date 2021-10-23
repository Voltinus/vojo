class CreateForumPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :forum_posts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :content
      t.belongs_to :forum_topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
