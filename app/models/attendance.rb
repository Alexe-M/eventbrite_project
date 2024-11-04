class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event


  validates :stripe_customer_id,
    presence: true, 
    uniqueness: true

  private

  def send_participation_email
    EventMailer.participation_email(event).deliver_later
  end


  
  
  
end


