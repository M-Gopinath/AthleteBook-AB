class Education < ActiveRecord::Base
	# has_one :education_type
	# has_one :institution
	belongs_to :education_type
	belongs_to :institution
end
