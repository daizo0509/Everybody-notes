class Tag < ApplicationRecord
	has_many :taggings,foreign_key: :tag_id, dependent: :destroy
  	has_many :posts, through: :taggings
  	accepts_nested_attributes_for :posts
end
