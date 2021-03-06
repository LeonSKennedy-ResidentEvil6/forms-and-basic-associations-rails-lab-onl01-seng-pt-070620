class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    self.artist ? self.artist.name : nil
  end 

  def song_genre
    self.genre.name if self.genre
  end 

  def song_genre=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end 

  def note_contents=(contents)
    contents.each do |content|
      unless content.empty?
        self.notes.build(content: content)
        # self.notes << Note.create(content: content)
        # self.save
      end
    end 
  end 

  def note_contents
    Self.notes.map(&:content)
  end 

end
