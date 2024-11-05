class User < ApplicationRecord
  after_create :send_welcome_email

  has_many :events  # Un utilisateur peut administrer plusieurs événements
  has_many :attendances  # Un utilisateur peut avoir plusieurs participations
  has_many :events_attended, through: :attendances, source: :event  # Un utilisateur participe à plusieurs événements

  has_many :events_administered, class_name: 'Event', foreign_key: 'user_id'
  
  validates :description, presence: true

  validates :first_name, presence: true

  validates :last_name, presence: true

  private 

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

end


