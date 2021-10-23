class ChangeContentToBeTextInForumPost < ActiveRecord::Migration[6.1]
  def change
    change_column :forum_posts, :content, :text
  end
end
