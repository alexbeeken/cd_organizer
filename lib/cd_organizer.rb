class Artist
  attr_reader(:artist, :albums)

  @@collection = []

  define_method(:initialize) do |attributes|
    @artist = attributes.fetch(:artist)
    @albums = [attributes.fetch(:albums)]
  end

  define_singleton_method(:get_collection) do
    @@collection
  end

  define_method(:save) do
    @@collection.push(self)
  end

  define_singleton_method(:clear) do
    @@collection = []
  end

  define_method(:add_album) do |album_title|
    @albums.push(album_title)
  end

  define_method(:delete_album) do |album_title|
    @albums.delete(album_title)
  end

  define_singleton_method(:delete_artist) do |artist|
    @@collection.delete(artist)
  end

  define_singleton_method(:find_artist) do |find_artist|
    @@collection.each do |artist_entry|
      if artist_entry.artist == find_artist
        return artist_entry
      end
    end
  end

end
