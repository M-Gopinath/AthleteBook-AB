# Athletes class
class AthletesController < ApplicationController
  def profile_field_update
    allowed_fields = %w(first_name phone sports_name address college exp)
    field = params[:field].try(:strip)
    if allowed_fields.include?(field)
      h = {}
      h[field.to_s] = params[:value].try(:strip)
      if @user.user_profile.update(h)
        render_success(msg: 'Profile updated successfully.')
      else
        render_failed(msg: 'Update failed')
      end
    else
      render_failed(msg: 'Invalid field.')
    end
  end

  def update_public_image
    if @user.user_profile.update(public_image: params[:file])
      render_success(msg: 'Public Image Uploaded Succesfully')
    else
      render_failed(msg: 'Image Upload Failed')
    end
  end

  def update_cover_image
    if @user.user_profile.update(cover_image: params[:file])
      render_success(msg: 'Cover Image Uploaded Succesfully')
    else
      render_failed(msg: 'Image Upload Failed')
    end
  end

  def profile
    data = {
      id: @user.id,
      first_name: @user.first_name,
      last_name: @user.last_name,
      email: @user.email,
      role: @user.role.name,
      gender: @user.gender,
      dob: @user.date_of_birth,
      phone: @user.user_profile.phone,
      sports_name: @user.user_profile.sports_name,
      address: @user.user_profile.address,
      college: @user.user_profile.college,
      exp: @user.user_profile.exp,
      public_image: @user.user_profile.public_image.url,
      cover_image: @user.user_profile.cover_image.url
    }
    render_success(profile: data)
  end

  def skills
    skills = @user.skills
    render_success(skills: skills)
  end
end # End of class
