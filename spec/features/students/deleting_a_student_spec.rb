describe 'editing a student' do
  let!(:student) { FactoryBot.create(:student) }
  let(:student_row_selector) { "tr[data-id='#{student.id}']" }

  it 'displays student information' do
    visit root_path

    within student_row_selector do
      click_link 'Destroy'
    end

    expect(current_path).to eq root_path
    expect(page).to have_content 'Student was successfully destroyed.'
    expect(page).not_to have_selector student_row_selector
  end
end
