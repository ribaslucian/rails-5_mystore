# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with 'rake db:populate'
# See Railscast 126 and the faker website for more information
namespace :db do
  # desc 'Erase and fill database'

  task populate: :environment do
    require 'faker'

    # recriamos o banco de dados
    Rake::Task['db:migrate:reset'].invoke

    10.times {
      Person.create({
        rg: Faker::Code.ean,
        cpf: CPF.generate,
        entity_attributes: {
          is_juridic: false,
          name: Faker::Name.name,
          addresses_attributes: [{
            priority: rand(1..10),
            type: 'Residencial',
            street: Faker::Address.street_name,
            zipcode: Faker::Address.zip_code,
            neighborhood: Faker::Address.city_prefix,
            number: Faker::Address.building_number,
            complement: Faker::Address.secondary_address,
            city: Faker::Address.city,
            state: Faker::Address.state,
            country: Faker::Address.country
          }],
          emails_attributes: [{
            priority: rand(1..10),
            email: Faker::Internet.email,
            description: Faker::Hacker.say_something_smart
          }],
          phones_attributes: [{
            priority: rand(1..10),
            phone: Faker::PhoneNumber.cell_phone,
            description: Faker::Hacker.say_something_smart
          }]
        }
      })
    }

    10.times {
      Corporate.create({
        corporate_name: Faker::Company.name,
        cnpj: CNPJ.generate,
        registration_municipal: Faker::Code.ean,
        registration_state: Faker::Code.ean,
        entity_attributes: {
          is_juridic: true,
          name: Faker::Company.suffix,
          addresses_attributes: [{
            priority: rand(1..10),
            type: 'Residencial',
            street: Faker::Address.street_name,
            zipcode: Faker::Address.zip_code,
            neighborhood: Faker::Address.city_prefix,
            number: Faker::Address.building_number,
            complement: Faker::Address.secondary_address,
            city: Faker::Address.city,
            state: Faker::Address.state,
            country: Faker::Address.country
          }],
          emails_attributes: [{
            priority: rand(1..10),
            email: Faker::Internet.email,
            description: Faker::Hacker.say_something_smart
          }],
          phones_attributes: [{
            priority: rand(1..10),
            phone: Faker::PhoneNumber.cell_phone,
            description: Faker::Hacker.say_something_smart
          }]
        }
      })
    }

    20.times do |i|
      Category.create({
        name: "Categoria #{i}",
        sufix: "c#{i}",
        description: "Descrição da categoria #{i}."
      })
    end
  end
end
