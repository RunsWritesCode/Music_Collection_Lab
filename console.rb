require_relative('./models/album.rb')
require_relative('./models/artist.rb')

artist_1 = Artist.new({ 'name' => 'Manic Street Preachers'})
artist_1.save()

artist_2 = Artist.new({ 'name' => 'Bob Dylan'})
artist_2.save()

artist_3 = Artist.new({ 'name' => 'The Pretenders'})
artist_3.save()

album_1 = Album.new({'title' => 'The Holy Bible', 'artist_id' => artist_1.id})
album_1.save

album_2 = Album.new({'title' => 'Blood on the tracks', 'artist_id' => artist_2.id})
album_2.save

album_3 = Album.new({'title' => 'Greatest Hits', 'artist_id' => artist_3.id})
album_3.save
