describe 'viewing a school' do
  let!(:school) { FactoryBot.create(:school) }

  it 'displays school information' do
    visit root_path

    click_link 'Schools'

    within "tr[data-id='#{school.id}']" do
      click_link 'Show'
    end

    expect(current_path).to eq school_path(school)

    expect(page).to have_content school.title
    expect(page).to have_content school.city
    expect(page).to have_content school.state
  end
end
