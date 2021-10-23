class ForumCategory < ApplicationRecord
  def topics_count
    count = 0
    ForumSubcategory.where(forum_category_id: id).each do |subcategory|
      count += subcategory.topics_count
    end
    count
  end

  def last_topic
    topics = []
    ForumSubcategory.where(forum_category_id: id).each do |subcategory|
      topics << subcategory.last_topic
    end
    topics.reject! { |x| x.nil? }
    topics.sort_by(&:created_at).last
  end
end
