module AlbumBelongsToArtist

  def album_belongs_to_artist
    unless self.album_id.nil?
      if self.album.artist_id.nil?
        self.errors.add :album, 'album hasn\'t artist'
      elsif self.album.artist_id != self.artist_id
        self.errors.add :album, 'album doesn\'t belong to artist'
      end
    end
  end
end