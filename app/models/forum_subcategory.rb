class ForumSubcategory < ApplicationRecord
  belongs_to :forum_category

  def category
    ForumCategory.find(forum_category_id)
  end

  def topics_count(locale)
    ForumTopic.where(forum_subcategory_id: id, language: locale).count
  end

  def last_topic(locale)
    ForumTopic.where(forum_subcategory_id: id, language: locale).order(created_at: :desc).first
  end
end
