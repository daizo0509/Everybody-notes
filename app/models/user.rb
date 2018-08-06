class User < ApplicationRecord
   has_many :posts ,foreign_key: :user_id, dependent: :destroy
   has_many :post_comments ,foreign_key: :user_id, dependent: :destroy
   has_many :likes ,foreign_key: :user_id, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

     attachment :profile_image

   validates :introduction,length: {maximum: 300}
end
