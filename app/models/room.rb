class Room < ApplicationRecord
    
    has_many :activitys, dependent: :destroy
    accepts_nested_attributes_for :activitys, reject_if: :all_blank, allow_destroy: true
    belongs_to :admin, inverse_of: :rooms

    has_many :room_users
    has_many :users, through: :room_users
    
end
