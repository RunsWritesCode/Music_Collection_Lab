require('pg')
require_relative('../db/sql_runner')

class Album
  attr_reader :title, :artist_id, :id

  def initialize(options)
    @title = options['title']
    @artist_id = options['artist_id']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO albums (title, artist_id)
    VALUES ($1,$2)
    RETURNING *"
    values = [@title, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def show_artist
    sql = "SELECT * FROM artists WHERE id = $1"
    value = [@artist_id]
    artist = SqlRunner.run(sql, value)
    return Artist.new(artist[0])
  end

end
