class Performance < ActiveRecord::Base
  validates :title, :presence => true
  validates :date, :presence => true

  has_many :performances_songs
  has_many :songs, :through =>  :performances_songs
end
