class AddLanguageToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :language, :integer
  end
end
