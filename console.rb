require('pry')
require_relative('models/property')

property1 = Property.new( { 'value'=> 10000, 'bedrooms'=> 3, 'year'=> 1900, 'build'=> "flat"})
property2 = Property.new( {'value' => 25000, 'bedrooms' => 4, 'year' => 1980, 'build' => "semi-detatched"})
property3 = Property.new( {'value' => 100000, 'bedrooms' => 6, 'year' => 1945, 'build' => "detatched"})

property1.save
property2.save
property1.value = 12500
property1.update

property2.delete
property3.save
find_property_value_100k = Property.find(property3.id)
binding.pry
nil
