AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

PropertyType.create(id: 1, name: 'Villa')
PropertyType.create(name: 'Apartment')
PropertyType.create(name: 'Finca')
PropertyType.create(name: 'Town house')
PropertyType.create(name: 'Guest house / B&B')
PropertyType.create(name: 'Barn')
PropertyType.create(name: 'Chalet')
PropertyType.create(name: 'House Boat')
PropertyType.create(name: 'Bungalow')
PropertyType.create(name: 'Castle / Chateau')

Audience.create(name: 'Private')
Audience.create(name: 'Friends & Family')
Audience.create(name: 'Trusted')
Audience.create(name: 'Public')

PlaceType.create(id: 1, name: 'Town')
PlaceType.create(id: 2, name: 'City')
PlaceType.create(id: 3, name: 'Golf Resort')
PlaceType.create(id: 4, name: 'Village')
PlaceType.create(id: 5, name: 'Resort')

Plan.create(name: 'Friends & Family')
Plan.create(name: 'Standard')




Country.create(id: 1, name: 'England', lat: 52.355518, lng: -1.174320, zoom: 5, inactive: false)
Country.create(id: 2, name: 'Scotland', lat: 56.490671, lng: -4.202646, zoom: 5, inactive: false)
Country.create(id: 3, name: 'Wales', lat: 52.130661, lng: -3.783712, zoom: 5, inactive: true)
Country.create(id: 4, name: 'Ireland', lat: 53.412910, lng: -8.243890, zoom: 5, inactive: true)
Country.create(id: 5, name: 'Northern Ireland', lat: 54.787715, lng: -6.492315, zoom: 5, inactive: true)
Country.create(id: 6, name: 'Spain', lat: 40.463667, lng: -3.749220, zoom: 5, inactive: false)
Country.create(id: 7, name: 'France', lat: 46.227638, lng: 2.213749, zoom: 5, inactive: true)
Country.create(id: 8, name: 'Italy', lat: 46.227638, lng: 2.213749, zoom: 5, inactive: false)
Country.create(id: 9, name: 'United States', lat: 37.090240, lng: -95.712891, zoom: 5, inactive: false)

Region.create(id: 1, name: 'Yorkshire Dales', country_id: 1, lat: 54.304602, lng: -2.192544, zoom: 8, inactive: false )
Region.create(id: 2, name: 'Lake District',  country_id: 1, lat: 54.478770, lng: -3.066540, zoom: 8, inactive: true )
Region.create(id: 3, name: 'Murcia Region',  country_id: 6, lat: 38.139814, lng: -1.366216, zoom: 8, inactive: true )
Region.create(id: 4, name: 'Lazio',  country_id: 8, lat: 38.139814, lng: -1.366216, zoom: 8, inactive: false )
Region.create(id: 5, name: 'Florida',  country_id: 9, lat: 27.664827, lng: -81.515754, zoom: 8, inactive: false )

Place.create(id: 1, name: 'Harrogate', place_type_id: 1, region_id: 1, lat: 53.992120, lng: -1.541812, zoom: 10, inactive: false)
Place.create(id: 2, name: 'Rudding Park', place_type_id: 2, region_id: 1, lat: 53.975048, lng: -1.495832, zoom: 13, inactive: false)
Place.create(id: 3, name: 'Ripon', place_type_id: 2, region_id: 1, lat: 54.135640, lng: -1.527334, zoom: 10, inactive: true)
Place.create(id: 4, name: 'Spofforth', place_type_id: 4, region_id: 1, lat: 53.952865, lng: -1.447851, zoom: 10, inactive: true)
Place.create(id: 5, name: 'Murcia', place_type_id: 4, region_id: 3, lat: 37.992240, lng: -1.130654, zoom: 10, inactive: false)
Place.create(id: 6, name: 'Rome', place_type_id: 4, region_id: 4, lat: 41.872389, lng: 12.480180, zoom: 10, inactive: false)
Place.create(id: 7, name: 'Kissimmee', place_type_id: 5, region_id: 5, lat: 28.291956, lng: -81.407571, zoom: 10, inactive: false)


FeatureType.create(id: 1, name: 'General')
FeatureType.create(id: 2, name: 'Kitchen')

Feature.create(id: 1, name: 'WiFi', feature_type_id: 1)
Feature.create(id: 2, name: 'High speed internet', feature_type_id: 1)
Feature.create(id: 3, name: 'Microwave', feature_type_id: 2)

user = User.new(
  :id                    => 1,
  :email                 => "steverdrew@gmail.com",
  :password              => "password",
  :password_confirmation => "password"
  )
user.skip_confirmation!
user.save!

Property.create(name: "St Andrew's Villa", description: 'Welcome to the St Andrews Villa website. You can find details of the Orlando Florida villa and why it is the vacation home for you and your family !

Superbly decorated villa in the ideal location - Indian Creek.

Come to St Andrews villa for a real Scottish welcome in the Florida sun - the place to relax away from the parks.', summary: 'Welcome to the St Andrews Villa website. You can find details of the Orlando Florida villa and why it is the vacation home for you and your family !

Superbly decorated villa in the ideal location - Indian Creek.

Come to St Andrews villa for a real Scottish welcome in the Florida sun - the place to relax away from the parks.', bedrooms: 5, capacity: 5, country_id: 9, region_id: 5, place_id: 7, user_id: 1, lat: 28.291956, lng: -81.407571, property_type: 1)

Amenity.create(id: '1', name:'Coffee')
Amenity.create(id: '2', name:'Restaurants')
Amenity.create(id: '3', name:'Theme Parks')
Amenity.create(id: '4', name:'Supermarkets')


