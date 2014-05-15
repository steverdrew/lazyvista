AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

PropertyType.create(name: 'Villa')
PropertyType.create(name: 'Apartment')
PropertyType.create(name: 'Finca')
PropertyType.create(name: 'Town house')

Country.create(id: 0001, name: 'England')
Country.create(id: 0002, name: 'Scotland')
Country.create(id: 0003, name: 'Wales')
Country.create(id: 0004, name: 'Spain')
Country.create(id: 0005, name: 'France')

Region.create(id: 0001, name: 'Yorkshire Dales', country_id: 0001 )
Region.create(id: 0002, name: 'Lake District',  country_id: 0001 )
