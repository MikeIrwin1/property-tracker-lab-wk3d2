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
    db.exec_prepared("save", values)
    db.close()

  end






end
