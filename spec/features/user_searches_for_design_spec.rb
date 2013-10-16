require 'spec_helper'

feature 'User searches for a design by name in the search bar' , %Q{
  As a user
  I want to search for a design by name
  So that I can easily and quickly find that design
  } do

  scenario 'user queries with the search bar' do

    user = FactoryGirl.create(:user)
    current_label = FactoryGirl.create(:design, :with_image)
    sign_in_as user

    visit design_path(current_design)

    visit designs_path

    fill_in 'q_design_cont', with: current_design.title

    click_button 'Search'

    expect(page).to have_selector('img')
  end
end
