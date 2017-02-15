class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :category, inclusion: { in: ["Furniture", "Lighting", "Home Appliance", "Garden"], allow_nil: false }
  CATEGORY = ["Furniture", "Lighting", "Home Appliance", "Garden"]
  mount_uploader :photo, PhotoUploader
end
