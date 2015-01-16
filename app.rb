require('sinatra')
require('sinatra/reloader')
require('./lib/cd_organizer')
also_reload('./lib/**/*.rb')
require('pry')


get('/') do
  @collection = Artist.get_collection()
  erb(:index)
end

post('/add') do
  @artist = params.fetch("artist")
  @album = params.fetch("album")
  @artist_instance = Artist.new({:artist => @artist, :albums => [@album]})
  @artist_instance.save()
  redirect '/'
end

post('/clear') do
  Artist.clear()
  redirect '/'
end

post('/delete_artist') do
  @id = (params.fetch("id")).to_i()
  @artist = Artist.find_by_id(@id)
  Artist.delete_artist(@artist)
  Artist.reassign_id()
  redirect '/'
end

post('/delete_album') do
  @album = (params.fetch("album"))
  @artist = Artist.search(@album)
  @artist.delete_album(@album)
  erb(:page)
end

get('/artist/:id') do
  @artist = Artist.find_by_id((params.fetch('id')).to_i)
  # binding.pry
  erb(:page)
end

post('/add_album') do
  @album = params.fetch("album")
  @id = params.fetch("id").to_i
  @artist = Artist.find_by_id(@id)
  @artist.add_album(@album)
  erb(:page)
end
