class UserProfile < ActiveRecord::Base
  mount_uploader :public_image
  mount_uploader :cover_image
  belongs_to :users
end
