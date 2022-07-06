require "faker"

puts "seeding data..."

10.times { Role.create(character_name: Faker::TvShows::FinalSpace.character) }

40.times do
  Audition.create(
    actor: Faker::Name.name,
    location: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone,
    hired: 0,
    role_id: rand(1..10)
  )
end

puts "all done!"
