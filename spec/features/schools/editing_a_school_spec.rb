describe 'editing a school' do
  let(:new_school_title) { 'Cosmo Canyon' }
  let(:new_school_city) { 'Gongaga' }
  let(:new_school_state) { 'Arkansas' }
  let!(:school) { FactoryBot.create(:school) }

  it 'displays school information' do
    visit root_path

    click_link 'Schools'

    within "tr[data-id='#{school.id}']" do
      click_link 'Edit'
    end

    expect(current_path).to eq edit_school_path(school)

    within '#school_form' do
      fill_in 'school_title', with: new_school_title
      fill_in 'school_city', with: new_school_city
      fill_in 'school_state', with: new_school_state

      click_button 'Update School'
    end

    expect(page).to have_content new_school_title
    expect(page).to have_content new_school_city
    expect(page).to have_content new_school_state
  end
end
