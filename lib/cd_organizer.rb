class Artist
  attr_reader(:artist, :albums, :id)

  @@collection = []

  define_method(:initialize) do |attributes|
    @artist = attributes.fetch(:artist)
    @albums = [attributes.fetch(:albums)]
    @id = @@collection.length().+(1)
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
    @index = @@collection.index(self)
    @albums.push(album_title)
    @@collection.insert(@index, self)
  end

  define_method(:delete_album) do |album_title|
    @albums.delete(album_title)
  end

  define_method(:assign_id) do |id|
    @id = id
  end

  define_singleton_method(:delete_artist) do |artist|
    @@collection.delete(artist)
  end

  define_singleton_method(:search) do |find_string|
    result = nil
    @@collection.each do |artist_entry|
      if artist_entry.artist == find_string
        result = artist_entry
      elsif artist_entry.albums.each() do |album_entry|
          if album_entry == find_string
            result = artist_entry
          end
        end
      end
    end
    result
  end

  define_singleton_method(:find_by_id) do |in_id|
    @@collection[in_id-1]
  end

  define_singleton_method(:reassign_id) do
    counter = 1
    @@collection.each() do |artist|
      artist.assign_id(counter)
      counter = counter + 1
    end
  end

end
