class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: true, uniqueness: true

  after_create :send_participation_email

  private

  def send_participation_email
    puts "Sending email for attendance: #{self.id}"
    EventMailer.participation_email(self).deliver_now
  end
  
end
