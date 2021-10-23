class ForumPost < ApplicationRecord
  belongs_to :user
  belongs_to :forum_topic

  def author
    User.find(user_id)
  end
end
