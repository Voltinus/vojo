class AddLanguageToForumTopic < ActiveRecord::Migration[6.1]
  def change
    add_column :forum_topics, :language, :integer
  end
end
