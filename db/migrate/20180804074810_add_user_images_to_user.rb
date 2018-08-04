class AddUserImagesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_images, :string
  end
end
