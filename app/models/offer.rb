class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :category, inclusion: { in: ["meubles", "luminaires", "electromenager", "jardin"], allow_nil: false }
  CATEGORY = ["meubles", "luminaires", "electromenager", "jardin"]
end
