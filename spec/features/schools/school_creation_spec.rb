describe 'school creation' do
  let(:school_attributes) { FactoryBot.attributes_for(:school) }

  it "creates the school" do
    visit root_path

    click_link 'Schools'

    click_link 'New School'

    expect(current_path).to eq new_school_path

    within '#school_form' do
      fill_in 'school_title', with: school_attributes[:title]
      fill_in 'school_city', with: school_attributes[:city]
      fill_in 'school_state', with: school_attributes[:state]

      click_button 'Create School'
    end

    school = School.first

    expect(current_path).to eq school_path(school)

    expect(page).to have_content school_attributes[:title]
    expect(page).to have_content school_attributes[:city]
    expect(page).to have_content school_attributes[:state]
  end
end
