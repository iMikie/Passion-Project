require 'CSV'


def import_CSV_of_songs
  headers = [:title, :song_number, :composer, :arranger_one, :arranger_two, :voicing, :description]
  csv_text = File.read("db/SOTS_Library.csv")
  song_hash = {}
  csv_array = CSV.parse(csv_text) do |row|
    row.each_with_index { |element, index| song_hash[headers[index]] = element }

    song_hash[:song_number] = song_hash[:song_number].to_i
    song = Song.create!(song_hash)
  end
  @signup_errors = new_user.errors.messages
  puts @signup_errors
end

import_CSV_of_songs

