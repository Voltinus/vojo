class ForumSubcategory < ApplicationRecord
  belongs_to :forum_category

  def category
    ForumCategory.find(forum_category_id)
  end

  def topics_count
    ForumTopic.where(forum_subcategory_id: id).count
  end

  def last_topic
    ForumTopic.where(forum_subcategory_id: id).order(created_at: :desc).first
  end
end
