require 'faker'

25.times do
  Artist.create ([{
    name: Faker::Name.name  
  }])

end
