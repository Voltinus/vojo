class Message < ApplicationRecord
  def from_user
    User.find(from_id)
  end

  def to_user
    User.find(to_id)
  end
end
