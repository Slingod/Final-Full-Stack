class User < ApplicationRecord
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :event_attendances, dependent: :destroy
  has_many :attended_events, through: :event_attendances, source: :event

  normalizes :email, with: ->(e) { e.strip.downcase }

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  def send_reset_password_instructions
    token = SecureRandom.hex(10)
    update(password_reset_token: token, password_reset_sent_at: Time.current)
    UserMailer.reset_password_instructions(self, token).deliver_now
  end

  # Méthode pour vérifier si l'utilisateur est un administrateur
  def admin?
    role == "admin"
  end
end
