class Event < ApplicationRecord
  belongs_to :user  # L'événement appartient à un utilisateur (administrateur)
  has_many :attendances  # Un événement peut avoir plusieurs participations
  has_many :participants, through: :attendances, source: :user  # Les utilisateurs participants via les participations

  validates :start_date, 
    presence: true

    validate :start_date_cannot_be_in_the_past


  validates :duration, 
    presence: true, 
    numericality: { only_integer: true, greater_than: 0 }

    validate :duration_multiple_of_five


  validates :title, 
    presence: true, length: { in: 5..140 }


  validates :description, 
    presence: true, length: { in: 20..1000 }

  validates :price, 
    presence: true, 
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  
  
  validates :location, 
    presence: true

  # Validation pour vérifier que l'événement a un organisateur
  validates :user_id, presence: true


  private

  def duration_multiple_of_five
    errors.add(:duration, "must be a multiple of 5") unless duration % 5 == 0 
    #errors.add est une méthode Rails qui ajoute un message d'erreur sur un attribut spécifique (ici, :duration).
    # calcule le reste de la division de duration par 5. Si le reste est 0, cela signifie que duration est un multiple de 5.
  end

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "must be a coming date") if start_date <= Time.now
  end

  

end

