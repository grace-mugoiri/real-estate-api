# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# #
#   properties = Property.create([{ address: '5th avenue' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Property.create(
	address: 'James Gichuru road',
	price: 100,
	occupied: true,
	description: 'Bedsitter in a family home compound'
)
Property.create(
	address: 'Wolf Of Wall Street',
	price: 500,
	occupied: false,
	description: '5 bedroom mansion with 3 1/2 bathrooms'
)
Property.create(
	address: 'Riara Villas',
	price: 350,
	occupied: false,
	description: '3 bedroom ensuite apartments '
)
Property.create(
	address: 'Athi River Settlings',
	price: 480,
	occupied: true,
	description: '4 bedroom bungalow with serenity to die for'
)
Property.create(
	address: 'Kimathi lane',
	price: 500,
	occupied: false,
	description: 'Rental shop'
)

