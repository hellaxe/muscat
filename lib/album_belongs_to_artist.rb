module AlbumBelongsToArtist
  def self.included(base)

  end
  def album_belongs_to_artist
    unless self.album_id == nil
      unless self.album.artist.id == self.artist.id
        self.errors.add :album, 'album doesn\'t belongs to artist'
      end
    end
  end
end