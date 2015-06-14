class Song < ActiveRecord::Base
  validates :song_number, :presence => true, :uniqueness => true
  validates :title, :presence => true

  has_many :performances_songs
  has_many :performances, :through =>  :performances_songs
end
