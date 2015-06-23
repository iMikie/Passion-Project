class Performance < ActiveRecord::Base
  validates :title, :presence => true
  validates :date, :presence => true

  has_many :performance_songs
  has_many :songs, :through =>  :performance_songs
end
