class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  enum language: [:en, :pl, :eo]

  def author
    User.find(user_id)
  end
end
