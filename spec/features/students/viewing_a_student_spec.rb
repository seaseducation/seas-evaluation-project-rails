describe 'viewing a student' do
  let!(:student) { FactoryBot.create(:student) }

  it 'displays student information' do
    visit root_path

    within "tr[data-id='#{student.id}']" do
      click_link 'Show'
    end

    expect(current_path).to eq student_path(student)

    expect(page).to have_content student.first_name
    expect(page).to have_content student.last_name
    expect(page).to have_content student.school.title
    expect(page).to have_content student.grade.title
    expect(page).to have_content student.program.title
  end
end
