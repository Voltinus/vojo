class ForumCategory < ApplicationRecord
  def topics_count(locale)
    count = 0
    ForumSubcategory.where(forum_category_id: id).each do |subcategory|
      count += subcategory.topics_count(locale)
    end
    count
  end

  def last_topic(locale)
    topics = []
    ForumSubcategory.where(forum_category_id: id).each do |subcategory|
      topics << subcategory.last_topic(locale)
    end
    topics.reject! { |x| x.nil? }
    topics.sort_by(&:created_at).last
  end
end
