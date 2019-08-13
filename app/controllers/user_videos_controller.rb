class UserVideosController < ApplicationController
include JsonRenderHelper
	def add_video
		@uservideo = UserVideo.new
	end

	def add_videos
		@uservideo = UserVideo.new(user_video_param.merge(user_id: current_user.id))
		if @uservideo.save	
       	redirect_to home_edit_profile_path
       	flash[:success] = "Your video has been successfully uploaded"
		else
			render :template => 'user_videos/add_video'
		end		
	end

	def upload_video
		@uservideo = UserVideo.new(user_video_param.merge(user_id: current_user.id))
		if @uservideo.save	
       	redirect_to home_edit_profile_path
       	flash[:success] = "Your video has been successfully uploaded"
		else
			render :template => 'user_videos/add_video'
		end
	end

	def remove_video
		@uservideo = UserVideo.find(params[:id])
		@uservideo.destroy
		redirect_to home_edit_profile_path
	end

	private

	def user_video_param
		params.require(:uservideo).permit(:user_video)
	end

end