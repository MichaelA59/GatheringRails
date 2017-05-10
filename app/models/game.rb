class Game < ApplicationRecord

  has_many :users, through: :users_games
  has_many :user_games

  validates :title, presence: true
  validates :gametype, presence: true
  validates :time, presence: true
  validates :date, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip, presence: true
  validates :number_of_players, presence: true

# def address
#   [address, city, zip].compact.join(', ')
# end

def full_address
   full_address = "#{self.address + self.city + self.zip}"
end

 geocoded_by :full_address, :latitude  => :lat, :longitude => :lo
 after_validation :geocode, if: :address_changed?
end
