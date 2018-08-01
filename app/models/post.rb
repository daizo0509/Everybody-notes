class Post < ApplicationRecord
	attr_accessor  :tag_list
	belongs_to :user, optional: true
	has_many :post_comments,foreign_key: :post_id, dependent: :destroy
	has_many :likes ,foreign_key: :post_id, dependent: :destroy
	  def like_user(user_id)
	   likes.find_by(user_id: user_id)
	  end
	has_many :taggings,foreign_key: :post_id, dependent: :destroy
	has_many :tags, through: :taggings,foreign_key: :post_id, dependent: :destroy

	def self.tagged_with(name)
		Tag.find_by_name!(name).post
	end

	def self.tag_count
		Tag.select("tags.*, count(taggings.tag_id) as count").jouns(:taggings).group("taggings.tag_id")
	end

	def tag_list
		tags.map(&:name).join(",")
	end

	def tag_list=(names)
		self.tags = names.split(",").map do |n|
			Tag.where(name: n.strip).first_or_create!
		end
	end

	def short_description
    	description[0, 9] + '...'
  	end

end
