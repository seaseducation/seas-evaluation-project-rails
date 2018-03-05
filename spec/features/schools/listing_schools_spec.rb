describe 'listing schools' do
  let!(:schools) { FactoryBot.create_list(:school, 3) }

  it 'displays data for all schools in a list' do
    visit root_path

    click_link 'Schools'

    expect(page).to have_content 'School List'

    within '.schools' do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'City'
      expect(page).to have_content 'State'
      expect(page).to have_content 'Students'

      schools.each do |school|
        expect(page).to have_content school.title
        expect(page).to have_content school.city
        expect(page).to have_content school.state
        expect(page).to have_content school.students.count
      end
    end
  end
end
