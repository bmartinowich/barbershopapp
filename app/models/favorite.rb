class Favorite < ActiveRecord::Base
    belongs_to :user
    has_many :favorite_barbers 
    has_many :favorited_by, through: :favorite_barbers, source: :user
end
