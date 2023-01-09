class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:recoverable,
         :rememberable, :validatable

  has_many :rooms
  #kaminari 
  paginates_per 9
end
