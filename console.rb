require('pry')
require_relative('models/property')

property1 = Property.new( { 'value'=> 10000, 'bedrooms'=> 3, 'year'=> 1900, 'build'=> "flat"})
property2 = Property.new( {'value' => 25000, 'bedrooms' => 4, 'year' => 1980, 'build' => "semi-detatched"})

property1.save
property2.save
property1.value = 12500
property1.update

property2.delete
binding.pry
nil
