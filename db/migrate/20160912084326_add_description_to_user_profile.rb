class AddDescriptionToUserProfile < ActiveRecord::Migration
  def change
  	add_column :user_profiles, :description, :string
  end
end
