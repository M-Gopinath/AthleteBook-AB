class Picture < ActiveRecord::Base
	belongs_to :user
	belongs_to :album
	mount_uploader :pic_upload
	validates :pic_upload,presence: true
end
