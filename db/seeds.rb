AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

PropertyType.create(name: 'Villa')
PropertyType.create(name: 'Apartment')
PropertyType.create(name: 'Finca')
PropertyType.create(name: 'Town house')

Country.create(id: 0001, name: 'England', lat: 52.355518, lng: -1.174320, zoom: 5)
Country.create(id: 0002, name: 'Scotland', lat: 54.304602, lng: -2.192544, zoom: 5)
Country.create(id: 0003, name: 'Wales', lat: 54.304602, lng: -2.192544, zoom: 5)
Country.create(id: 0004, name: 'Spain', lat: 54.304602, lng: -2.192544, zoom: 5)
Country.create(id: 0005, name: 'France', lat: 54.304602, lng: -2.192544, zoom: 5)

Region.create(id: 0001, name: 'Yorkshire Dales', country_id: 0001, lat: 54.304602, lng: -2.192544, zoom: 9 )
Region.create(id: 0002, name: 'Lake District',  country_id: 0001,lat: 54.304602, lng: -2.192544, zoom: 9 )
