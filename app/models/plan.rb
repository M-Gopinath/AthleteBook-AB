class Plan < ActiveRecord::Base
	def plans_desc
		if self.id == 1
			["1.Stand out and get in touch with hiring managers", "1.See how you compare to other applicants", "1.Learn new skills to advance your career"]
		elsif
			id == 2
			["2.Stand out and get in touch with hiring managers", "2.See how you compare to other applicants", "2.Learn new skills to advance your career"]
		elsif
			id == 3
			["3.Stand out and get in touch with hiring managers", "3.See how you compare to other applicants", "3.Learn new skills to advance your career"]
		else
			id == 4
			["4.Stand out and get in touch with hiring managers", "4.See how you compare to other applicants", "4.Learn new skills to advance your career"]
		end
	end
end
