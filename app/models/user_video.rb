class UserVideo < ActiveRecord::Base
	belongs_to :user
	mount_uploader :user_video
	validate :user_upload_video_limit_not_exceed_ten, :on => :create

	def user_upload_video_limit_not_exceed_ten
		user = User.find(user_id)
		video_count = user.user_videos.size
		if video_count >= 10
		  errors.add(:user_video, "Already you have uploaded maximum videos, if you want to continue, please remove some videos.")
		end
	end
end
