class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :song_number
      t.string  :title, limit, 50
      t.string  :composer, limit, 50
      t.string  :larger_work, limit: 50
      t.string  :arranger_one, limit: 50
      t.string  :arranger_two, limit: 50
      t.string  :voicing, limit: 8
      t.string  :description
      t.string  :pdf_url

      t.timestamps
    end
  end
end
