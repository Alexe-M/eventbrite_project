class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances #events the user is attending through participation
  has_many :organized_events, class_name: 'Event', foreign_key: 'user_id' #events the user is organising 
  
  validates :description, presence: true

  validates :first_name, presence: true

  validates :last_name, presence: true


end



###Class_name explanation:
  # Define a has_many :organized_events association to represent the events the user organizes.
  # Use class_name to refer to the Event model for organized_events.
  # Use foreign_key to indicate that this relationship relies on the user_id in the events table.

  # organized_events: This refers to the events the user organizes. Using class_name: 'Event' tells Rails that organized_events is associated with the Event model, and foreign_key: 'user_id' specifies that user_id in the events table should match the user’s ID.
