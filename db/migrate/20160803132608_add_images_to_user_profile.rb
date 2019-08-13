class AddImagesToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :public_image, :string
    add_column :user_profiles, :cover_image, :string
  end
end
