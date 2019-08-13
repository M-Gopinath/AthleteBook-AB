# educatation class
class EducationsController < ApplicationController

	def institution
		institutions = Institution.select(:id, :name)
		render_success(institutions: institutions)
	end

	def education_type
		education_types =EducationType.select(:id, :name)
		render_success(education_types: education_types)
	end

	def index
		educations = Education.select(:id, :period, :course_of_study, :activities, :descripition, :user_id)
		render_success(educations: educations)
	end

	def create
		#education = AthleteEducation.where(id: params[:id].to_i).first
		education = @user.educations.create(education_params)
		if education.present?
			edu_type = education.education_type.name
			inst = education.institution.name
			# render_success(msg: 'Athlete Education successfully added', edu_type: edu_type, inst: inst)
			render json: {
				msg: 'Athlete Education successfully added.', 
				edu_type: edu_type,
				inst: inst
				}, status: 'Success'
			else
				render_failed(msg: 'Athlete Education add failed')
			end
		end

		def edit
			education = Education.find(params[:id].to_i)
			if education.present?
				education.update(education_params)
				render_success(msg: 'Education successfully updated')
			else
				render_failed(msg: 'Education update failed')
			end
		end

		def delete
			education = Education.find(params[:id].to_i)
			if education.present?
				education.delete
				render_success(msg: 'Education successfully deleted')
			else
				render_failed(msg: 'Education delete failed')
			end
		end

		private
		
		def education_params
			params.require(:education).permit(:id, :period, :course_of_study, :activities, :descripition, :user_id, :institution_id, :education_type_id)
		end
	end
