describe 'editing a student' do
  let(:new_student_first_name) { 'Yuffie' }
  let(:new_student_last_name) { 'Kisaragi' }
  let!(:new_school) { FactoryBot.create(:school, title: 'Test') }
  let!(:new_grade) { Grade.find_by_title('1st') }
  let!(:new_program) { Program.find_by_title('504') }
  let!(:student) { FactoryBot.create(:student) }

  it 'displays student information' do
    visit root_path

    within "tr[data-id='#{student.id}']" do
      click_link 'Edit'
    end

    expect(current_path).to eq edit_student_path(student)

    within '#student_form' do
      fill_in 'student_first_name', with: new_student_first_name
      fill_in 'student_last_name', with: new_student_last_name
      select new_school.title, from: 'School'
      select new_grade.title, from: 'Grade'
      select new_program.title, from: 'Program'

      click_button 'Update Student'
    end

    expect(page).to have_content new_student_first_name
    expect(page).to have_content new_student_last_name
    expect(page).to have_content new_school.title
    expect(page).to have_content new_grade.title
    expect(page).to have_content new_program.title
  end
end
