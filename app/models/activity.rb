class Activity < ApplicationRecord
  paginates_per 10

  has_many :archives, dependent: :destroy
  accepts_nested_attributes_for :archives, allow_destroy: true
  
  belongs_to :room, inverse_of: :activitys
  belongs_to :admin
end
