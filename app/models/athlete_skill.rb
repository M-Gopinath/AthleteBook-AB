class AthleteSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  validates :skill_id, presence: true
  validates :user_id, presence: true
  validate :skill_id_unique_for_user?

  def skill_id_unique_for_user?
    user = User.find user_id
    if user.skills.where(id: skill_id).first.present?
      errors.add(:skill_id, 'already exists')
    end
  end
end
