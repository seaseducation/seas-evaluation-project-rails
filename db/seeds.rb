grades = Grade::VALID_TITLES.map do |grade|
  Grade.create!(title: grade)
end

programs = Program::VALID_TITLES.map do |program|
  Program.create!(title: program)
end

schools = [{
  title: 'Balamb Garden',
  city: Faker::Address.city,
  state: Faker::Address.state
}, {
  title: 'Midgar High School',
  city: Faker::Address.city,
  state: Faker::Address.state
}].map do |school|
  School.create(school)
end

100.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    grade: grades.sample,
    program: (programs + [nil]).sample,
    school: schools.sample
  )
end
