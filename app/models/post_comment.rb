class PostComment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true

  validates :comment, presence: true
end
