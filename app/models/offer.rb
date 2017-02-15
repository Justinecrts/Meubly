class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :category, inclusion: { in: ["meubles", "luminaires", "electromenager", "jardin"], allow_nil: false }
  CATEGORY = ["meubles", "luminaires", "electromenager", "jardin"]
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
