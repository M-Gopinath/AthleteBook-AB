class AlbumsController < ApplicationController


	def album_new
		@album = current_user.Album.new
		
	end

	def album_create
		@album = current_user.albums.build(album_params)
		@album.save
		
	end

	def  picture_new
		@picture = current_user.Picture.new

		
	end

	def picture_create
		@picture = current_user.pictures.build(pic_params)
		@picture.save
	end
	


	private

	def album_params
		params.require(:album).permit(:user_id,:album_name)
		
	end

	def pic_params
		params.require(:picture).permit(:user_id,:album_id,:pic_upload)	
		
	end

end
