class Building < ApplicationRecord
  belongs_to :building_type
  has_many :bodies
  has_many :outdoors
  has_many :maintenances
end
