require('pg')
require_relative('../db/sql_runner')

class Album
  attr_reader :title, :artist_id, :id

  def initialize(options)
    @title = options['title']
    @artist_id = options['artist_id']
    @id = options['id'].to_i if options['id']
  end

end
