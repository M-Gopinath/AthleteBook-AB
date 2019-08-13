class Career < ActiveRecord::Base
	mount_uploader :career_file
	validates :carrer_name, presence: {message: "Name cann't be blank"}
	validates :year,presence: true
end
