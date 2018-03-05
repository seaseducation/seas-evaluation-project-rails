FactoryBot.define do
  factory :student do
    grade
    program
    school
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end
end
