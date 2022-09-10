puts 'deleting all data...'

User.destroy_all
Contact.destroy_all

puts 'criando utilizadores...'

contact_id = 1

1.upto(15) do |n|
  username = "#{Faker::Name.first_name}#{n}"
  user = User.new(
    id: n,
    name: username,
    email: "useremail#{n}@email.com",
    password: '123456',
    password_confirmation: '123456'
  )
 p user.save!

  
  puts "criando contatos do #{username}"

  1.upto(10) do |num|
    random_n = rand(1950..2020)
    rand_n = rand(1..12)
    Contact.create!(id: contact_id, 
      full_name: Faker::Name.name, 
      cpf: Faker::Number.unique.number(digits: 11).to_s, 
      email: Faker::Internet.unique.email, 
      birth_date: Date.parse("#{random_n}-#{rand_n}-#{num}"), 
      user_id: user.id)

    address = Address.create!(id: contact_id, 
      cep: Faker::Number.unique.number(digits: 8).to_s, 
      street: Faker::Address.street_name, 
      number: Faker::PhoneNumber.cell_phone, 
      district: "Perpétuo Socorro", 
      city: Faker::Address.city, 
      state: Faker::Address.state_abbr, 
      contact_id: contact_id)

      contact_id += 1
  end
  puts "Terminando contatos do #{username}"
end

puts 'Terminando contatos do...'

p "Created #{User.count} utilizadores"
p 'Finished seeding...'
