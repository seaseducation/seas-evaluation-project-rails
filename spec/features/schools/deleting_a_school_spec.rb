describe 'editing a school' do
  let!(:school) { FactoryBot.create(:school) }
  let(:school_row_selector) { "tr[data-id='#{school.id}']" }

  it 'displays school information' do
    visit schools_path

    within school_row_selector do
      click_link 'Destroy'
    end

    expect(current_path).to eq schools_path
    expect(page).to have_content 'School was successfully destroyed.'
    expect(page).not_to have_selector school_row_selector
  end
end
