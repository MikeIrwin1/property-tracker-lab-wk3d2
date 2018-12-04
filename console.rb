require('pry')
require_relative('models/property')

property1 = Property.new({ 'value'=> 10000, 'bedrooms'=> 3, 'year'=> 1900, 'build'=> "flat"})
