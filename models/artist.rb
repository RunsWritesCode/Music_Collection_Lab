require('pg')
require_relative('../db/sql_runner')

class Artist
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) Returning *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map {|artist| Artist.new(artist)}
  end

  def albums_by_artist
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map {|album| Album.new(album)}
  end

end
