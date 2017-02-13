class Booking < ApplicationRecord
  belongs_to :furniture
  belongs_to :user
end
