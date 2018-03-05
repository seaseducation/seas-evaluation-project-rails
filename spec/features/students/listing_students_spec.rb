describe 'listing students' do
  let!(:students) { FactoryBot.create_list(:student, 3) }

  it "displays students' information" do
    visit root_path

    expect(page).to have_content 'Student List'

    expect(page).to have_content 'First Name'
    expect(page).to have_content 'Last Name'
    expect(page).to have_content 'Grade'
    expect(page).to have_content 'Program'

    students.each do |student|
      within "tr[data-id='#{student.id}']" do
        expect(page).to have_content student.first_name
        expect(page).to have_content student.last_name
        expect(page).to have_content student.grade.title
        expect(page).to have_content student.program.title
      end
    end
  end
end
