 # Skills class
 class SkillsController < ApplicationController
  def index
    skills = Skill.select(:id, :name)
    render_success(skills: skills)
  end

  def add
    skill = Skill.where(id: params[:id].to_i).first
    athlete_skill = @user.athlete_skills.create(skill_id: skill.id)
    if skill.present? && athlete_skill.persisted?
      render_success(msg: 'Skill added successfully')
    else
      render_failed(msg: 'Skill add failed',
        errors: athlete_skill.errors.full_messages)
    end
  end

  def remove
    skill = Skill.where(id: params[:id].to_i).first
    athlete_skill = @user.athlete_skills.where(skill_id: skill.id).first
    if skill.present? && athlete_skill.present?
      athlete_skill.delete
      render_success(msg: 'Skill deleted successfully')
    else
      render_failed(msg: 'Skill deletion failed')
    end
  end
    end # End of class