class Post < ApplicationRecord
	attr_accessor  :tag_list
	belongs_to :user 
	has_many :post_comments
	has_many :likes
	  def like_user(user_id)
	   likes.find_by(user_id: user_id)
	  end
	has_many :taggings
	has_many :tags, through: :taggings

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

end
