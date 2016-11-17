require('pg')
require_relative('../db/sql_runner')

class Artist
  attr_reader :name, :id

  def initialize( options )
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = 
    "INSERT INTO artists
    (name) 
    VALUES 
    ('#{@name}') RETURNING *; 
    "
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run( sql )
    return artists.map { |hash| Artist.new( hash )
    }
  end

end


