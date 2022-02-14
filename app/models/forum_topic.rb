class ForumTopic < ApplicationRecord
  belongs_to :forum_subcategory
  enum language: [:en, :pl, :eo]

  def subcategory
    ForumSubcategory.find(forum_subcategory_id)
  end

  def category
    ForumCategory.find(subcategory.forum_category_id)
  end

  def author
    User.find(user_id)
  end

  def last_post
    ForumPost.where(forum_topic_id: id).order(created_at: :desc).first
  end
end
