class Like < ApplicationRecord
  belongs_to :use
  belongs_to :post,counter_cache: :likes_count
end
