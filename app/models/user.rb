class User < ActiveRecord::Base
  # include PgSearch
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Associations
  belongs_to :role
  has_one :user_profile
  has_one :user_subscription
  has_one :plan, class_name: 'UserSubscription', foreign_key: 'plan_id'
  has_one :plan_period, class_name: 'UserSubscription', foreign_key: 'plan_period_id'
  has_many :auth_tokens
  has_many :athlete_skills
  has_many :skills, through: :athlete_skills
  has_many :experiences
  has_many :careers
  has_many :educations
  has_many :education_type
  has_many :institutions
  has_many :payment_histories
  has_many :sponsors
  has_many :user_videos
  has_many :pictures
  has_many :albums
  has_one :user_plan
  scope :all_users, -> { where.not(role_id: Role.find_by_name('admin')) }
  mount_uploader :company_logo

  #Validations

  def generate_auth_token
    key = Rails.application.secrets.secret_key_base
    exp = (Time.now + 1.day).to_i
    payload = { data: email, exp: exp }
    token = JWT.encode payload, key, 'HS256'
    auth_tokens.create(token: token)
    token
  end

  def self.decode_token(token)
    key = Rails.application.secrets.secret_key_base
    JWT.decode token, key, true, algorithm: 'HS256'
  rescue
    false
  end

  def self.verify_token(token)
    return false unless AuthToken.where(token: token).first.present?
    detoken = decode_token(token)
    (detoken.present? && (Time.at(detoken.first['exp']) > Time.now)) ? true : false
  end

  def self.token_user(token)
    AuthToken.where(token: token).first.user
  end

  # def generate_auth_token
  #   expiration = 24.hours.from_now
  #   exp = Time.now.to_i + expiration.to_i
  #   exp_payload = { :data => self.email, :exp => exp }
  #   token = JWT.encode exp_payload, "hmac_secret", 'HS256'
  # end

  def self.already_exist?(email)
    find_by_email(email).present?
  end

  def athlete?
    role.name == 'athelet'
  end

  def admin?
    role_id == Role.find_by_name('admin').id
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def active?
    is_active? ? 'Yes' : 'No'
  end

  def payment_plan(plan_id)
    exp_date = nil
    case plan_id
    when '1'
      exp_date = Time.now + 1.month
    when '2'
      exp_date = Time.now + 2.month
    when '3'
      exp_date = Time.now + 3.month
    when '4'
      exp_date = Time.now + 4.month
    end
    exp_date
  end

end
