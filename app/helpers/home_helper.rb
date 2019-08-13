module HomeHelper
	def user_details(user, name)
		case name
		when 'first_name'
			user.first_name ? user.first_name : 'First name empty'
		when 'last_name'
			user.last_name ? user.last_name : 'Last name empty'
		when 'gender'
			user.gender ? user.gender : 'Gender empty'
		when 'email'
			user.email ? user.email : 'Email empty'
		when 'date_of_birth'
			user.date_of_birth ? user.date_of_birth : 'Date Of Birth empty'
		end
	end

	def athlete_details(athlete, name)
		case name
		when 'public_image'
				athlete.public_image ? athlete.public_image : 'public_image empty'
		when 'phone'
			athlete.phone ? athlete.phone : 'phone empty'
		when 'sports_name'
			athlete.sports_name ? athlete.sports_name : 'sports_name empty'
		when 'address'
			athlete.address ? athlete.address : 'address empty'
		when 'college'
			athlete.college ? athlete.college : 'college empty'
		when 'exp'
			athlete.exp ? athlete.exp : 'exp empty'
		when 'description'
			athlete.description ? athlete.description : 'description empty'
		end
	end
end
