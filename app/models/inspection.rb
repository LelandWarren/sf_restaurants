class Inspection < ApplicationRecord
  belongs_to :restaurant
  has_many :violations
end
