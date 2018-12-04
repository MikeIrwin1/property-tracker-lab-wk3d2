require('pg')
class Property

  attr_accessor :value, :bedrooms, :year, :build
  attr_reader


  def initialize(options)
  @value = options['value']
  @bedrooms = options['bedrooms']
  @year = options['year']
  @build = options['build']

  end

  def save()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "INSERT INTO portfolio (value, bedrooms, year, build)"
  end






end
