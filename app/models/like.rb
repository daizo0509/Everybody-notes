class Like < ApplicationRecord
  belongs_to :post,counter_cache: :likes_count, optional: true
  belongs_to :user, optional: true
end
