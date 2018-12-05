require('pg')
class Property

  attr_accessor :value, :bedrooms, :year, :build
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @value = options['value']
    @bedrooms = options['bedrooms']
    @year = options['year']
    @build = options['build']

  end

  def save()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "INSERT INTO portfolio (value, bedrooms, year, build)
    VALUES ($1, $2, $3, $4)
    RETURNING *
    "
    values = [@value, @bedrooms, @year, @build]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "UPDATE portfolio
    SET (value, bedrooms, year, build) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@value, @bedrooms, @year, @build, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def delete()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "DELETE FROM portfolio
    WHERE id = $1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()

    def Property.find(id)
      db = PG.connect({dbname: 'properties', host: 'localhost'})
      sql = "SELECT * FROM portfolio
      WHERE id = $1"
      values = [id]
      db.prepare("find_one", sql)
      retrieved_array = db.exec_prepared("find_one", values)
      db.close()
      retrieved_hash = retrieved_array[0]
      found_property = Property.new(retrieved_hash)
      return found_property
    end
  end


end
