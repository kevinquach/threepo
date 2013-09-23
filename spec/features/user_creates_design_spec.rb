require 'spec_helper'

feature 'user creates design', %q{
  As a designer
  I want to upload one of my designs
  So that I can share it with the world
} do

  context 'as a user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end

    scenario 'fills in form to create design' do
      visit new_design_path

      fill_in 'Title', with: 'Brand spanking new design'
      fill_in 'Description', with: 'Best design youve ever seen'

      click_button 'Upload Design'

      expect(page).to have_content('Successfully uploaded design')

      expect(Design.count).to eql(1)

      design = Design.first
      expect(design.user).to eql(user)
      expect(design.title).to eql('Brand spanking new design')
      expect(design.description).to eql('Best design youve ever seen')
    end
  end
end
