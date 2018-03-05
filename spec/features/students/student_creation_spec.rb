describe 'student creation' do
  let(:student_attributes) { FactoryBot.attributes_for(:student) }
  let(:school_attributes) { FactoryBot.attributes_for(:school) }
  let(:grade_attributes) { FactoryBot.attributes_for(:grade) }
  let(:program_attributes) { FactoryBot.attributes_for(:program) }
  let!(:school) { FactoryBot.create(:school) }

  it "creates the student" do
    visit root_path

    click_link 'Students'

    click_link 'New Student'

    expect(current_path).to eq new_student_path

    within '#student_form' do
      fill_in 'student_first_name', with: student_attributes[:first_name]
      fill_in 'student_last_name', with: student_attributes[:last_name]
      select school_attributes[:title], from: 'School'
      select grade_attributes[:title], from: 'Grade'
      select program_attributes[:title], from: 'Program'

      click_button 'Create Student'
    end

    student = Student.first

    expect(current_path).to eq student_path(student)

    expect(page).to have_content student_attributes[:first_name]
    expect(page).to have_content student_attributes[:last_name]
    expect(page).to have_content school_attributes[:title]
    expect(page).to have_content grade_attributes[:title]
    expect(page).to have_content program_attributes[:title]
  end
end
