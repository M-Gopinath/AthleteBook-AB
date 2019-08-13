class Sponsor < ActiveRecord::Base
	belongs_to :user
	validates :company_id,presence: true
end
