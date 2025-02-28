class User < ApplicationRecord
  has_secure_password

  # Associations
  has_many :events, dependent: :destroy
  has_many :event_attendances, dependent: :destroy
  has_many :attended_events, through: :event_attendances, source: :event

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :description, length: { maximum: 500 }, allow_blank: true

  ROLES = ["user", "admin", "organizer"]

  def admin?
    admin
  end
  

  def organizer?
    role == "organizer"
  end


  # Set default role
  after_initialize do
    self.role ||= :user if self.has_attribute?(:role)
  end

  # Support for profile picture
  has_one_attached :profile_picture

  # Password reset method
  def send_reset_password_instructions
    token = SecureRandom.hex(10)
    update(password_reset_token: token, password_reset_sent_at: Time.current)
    UserMailer.reset_password_instructions(self, token).deliver_now
  end

  # Vérifier si un utilisateur peut modifier son propre profil
  def can_edit?(current_user)
    self == current_user || current_user.admin?
  end

  # Vérifier si un utilisateur peut être supprimé par un autre utilisateur
  def can_be_deleted_by?(current_user)
    current_user.admin? || self == current_user
  end
end
