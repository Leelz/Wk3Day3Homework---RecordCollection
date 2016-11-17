require('pg')
require_relative('../db/sql_runner')

class Album
attr_reader :title, :genre, :id, :collector_id, :artist_id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @collector_id = options['collector_id'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql =
    "INSERT INTO albums 
    (title, genre, collector_id) 
    VALUES 
    ('#{@title}', '#{@genre}', #{@collector_id}) RETURNING *; 
    "
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def delete
    return unless @id
    sql = "DELETE FROM 
    albums WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def update
    return unless @id
    sql = "UPDATE albums SET 
      (topping, quantity, customer_id) = 
      ('#{@title}', '#{@genre}', #{@collector_id}) WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def self.all
    sql = "SELECT * FROM album_collections;"
    albums = SqlRunner.run( sql )
    return albums.map { |hash| Album.new( hash )
    }
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = #{artist_id}"
    result = SqlRunner.run( sql )
    artist = Artist.new(  result[0] )
    return artist
  end

end
