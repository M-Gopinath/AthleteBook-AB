class Album < ActiveRecord::Base
	belongs_to :user
	has_many :pictures
	validates :album_name,presence: true
end
