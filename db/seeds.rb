# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creating City, State, Country

@countries = ["Afghanistan","Åland Islands","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica","Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Bouvet Island","Brazil","British Indian Ocean Territory","Brunei Darussalam","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China","Christmas Island","Cocos (Keeling) Islands","Colombia","Comoros","Congo","Congo [DRC]","Cook Islands","Costa Rica","Côte d’Ivoire","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands [Islas Malvinas]","Faroe Islands","Fiji","Finland","France","French Guiana","French Polynesia","French Southern Territories","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guernsey","Guinea","Guinea-Bissau","Guyana","Haiti","Heard Island and McDonald Islands","Holy See (Vatican City State)","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","South Korea","North Korea","Kuwait","Kyrgyzstan","Lao People’s Democratic Republic","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macao","Macedonia [FYROM]","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Micronesia","Moldova","Monaco","Mongolia","Serbia and Montenegro","Montserrat","Morocco","Mozambique","Myanmar [Burma]","Namibia","Nauru","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Niue","Norfolk Island","Northern Mariana Islands","Norway","Oman","Pakistan","Palau","Palestinian Territories","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn","Poland","Portugal","Puerto Rico","Qatar","Réunion","Romania","Russia","Rwanda","Saint Barthélemy","Saint Helena","Saint Kitts and Nevis","Saint Lucia","Saint Martin","Saint Pierre and Miquelon","Saint Vincent and the Grenadines","Samoa","San Marino","São Tomé and Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and the South Sandwich Islands","Spain","Sri Lanka","Sudan","Suriname","Svalbard and Jan Mayen","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor-Leste","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands","Uruguay","Uzbekistan","Vanuatu","Venezuela","Vietnam","British Virgin Islands","U.S. Virgin Islands","Wallis and Futuna","Western Sahara","Yemen","Zambia","Zimbabwe"]
@country_codes = ["AF","AX","AL","DZ","AS","AD","AO","AI","AQ","AG","AR","AM","AW","AU","AT","AZ","BS","BH","BD","BB","BY","BE","BZ","BJ","BM","BT","BO","BA","BW","BV","BR","IO","BN","BG","BF","BI","KH","CM","CA","CV","KY","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","CI","HR","CU","CY","CZ","DK","DJ","DM","DO","EC","EG","SV","GQ","ER","EE","ET","FK","FO","FJ","FI","FR","GF","PF","TF","GA","GM","GE","DE","GH","GI","GR","GL","GD","GP","GU","GT","GG","GN","GW","GY","HT","HM","VA","HN","HK","HU","IS","IN","ID","IR","IQ","IE","IM","IL","IT","JM","JP","JE","JO","KZ","KE","KI","KR","KP","KW","KG","LA","LV","LB","LS","LR","LY","LI","LT","LU","MO","MK","MG","MW","MY","MV","ML","MT","MH","MQ","MR","MU","YT","MX","FM","MD","MC","MN","ME","MS","MA","MZ","MM","NA","NR","NP","NL","AN","NC","NZ","NI","NE","NG","NU","NF","MP","NO","OM","PK","PW","PS","PA","PG","PY","PE","PH","PN","PL","PT","PR","QA","RE","RO","RU","RW","BL","SH","KN","LC","MF","PM","VC","WS","SM","ST","SA","SN","RS","SC","SL","SG","SK","SI","SB","SO","ZA","GS","ES","LK","SD","SR","SJ","SZ","SE","CH","SY","TW","TJ","TZ","TH","TL","TG","TK","TO","TT","TN","TR","TM","TC","TV","UG","UA","AE","GB","US","UM","UY","UZ","VU","VE","VN","VG","VI","WF","EH","YE","ZM","Z"]

@countries.zip(@country_codes).each do |country, country_code|
	new_country = Country.find_or_create_by(name: country, code: country_code)
end

# Athletes
@user = User.find_or_create_by(first_name: 'ath1') do |u|
  u.last_name = 'last'
  u.email = 'ath1@yopmail.com'
  u.password = 'Password@123'
	u.password_confirmation = 'Password@123'
  u.role_id = 1
  u.gender = 'Male'
  u.date_of_birth = '2000-01-01'
  u.country_id = 1
  u.is_active = true
	u.confirmed_at = Time.now
end
@user.create_user_profile!

#Team 
@user = User.find_or_create_by(first_name: 'team1') do |u|
  u.last_name = 'team'
  u.email = 'team1@yopmail.com'
  u.password = 'Password@123'
  u.password_confirmation = 'Password@123'
  u.role_id = 2
  u.gender = 'Male'
  u.date_of_birth = '2000-01-01'
  u.country_id = 2
  u.is_active = true
  u.confirmed_at = Time.now
end
@user.create_user_profile!

#company
@user = User.find_or_create_by(first_name: 'company1') do |u|
  u.last_name = 'company'
  u.email = 'company1@yopmail.com'
  u.password = 'Password@123'
  u.password_confirmation = 'Password@123'
  u.role_id = 3
  u.gender = 'Male'
  u.date_of_birth = '2000-01-01'
  u.country_id = 3
  u.is_active = true
  u.confirmed_at = Time.now
end
@user.create_user_profile!


['Athlete', 'Team', 'Company', 'Admin'].each do |r|
	Role.find_or_create_by(name: r, is_active: true)
end

admin_role_id = Role.find_by(name: 'Admin').id
unless User.already_exist?("admin@example.com")
  user = User.new(
    :email                 => "admin@example.com",
    :password              => "Password@123!",
    :password_confirmation => "Password@123!",
    :role_id => admin_role_id,
    :is_active => true
  )
  user.skip_confirmation!
  user.save!
end

p 'Plan seed start'

bronze = Plan.find_or_create_by(name: 'Bronze') do |p|
  p.price = 100
  p.description = "First level"
end

silver = Plan.find_or_create_by(name: 'Silver') do |p|
  p.price = 200
  p.description = "Second level"
end

gold = Plan.find_or_create_by(name: 'Gold') do |p|
  p.price = 300
  p.description = "Third level"
end

diamond = Plan.find_or_create_by(name: 'diamond') do |p|
  p.price = 400
  p.description = "Last level"
end
p 'Plan seed end'

# Skills
p 'Skills importing from yml file'
skills = YAML.load_file(Rails.root.join('db', 'seeds', 'skills.yml'))
skills.each do |skill|
  Skill.find_or_create_by(name: skill)
end
p 'Institution importing from yml file'
institutions = YAML.load_file(Rails.root.join('db', 'seeds', 'institutions.yml'))
institutions.each do |institution|
  Institution.find_or_create_by(name: institution)
end
p 'Education type'
['High school','Undergraduate Degree','Master Degree','Engineering','Others'].each do |e|
  EducationType.find_or_create_by(name: e,)
end
p 'Seed finished'

