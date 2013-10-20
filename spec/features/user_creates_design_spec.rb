require 'spec_helper'

feature 'user creates design', %q{
  As a designer
  I want to upload one of my designs
  So that I can share it with the world
} do

  context 'as a user' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'fills in form to create design' do
      visit new_design_path

      fill_in 'Name your design!', with: 'Brand spanking new design'
      fill_in 'Describe your design!', with: 'Best design youve ever seen'
      attach_file 'Image', 'spec/support/sample.jpg'
      page.has_css?('img', text: "sample.jpg")

      click_button 'Upload Your Design'

      expect(page).to have_content('Successfully uploaded design')
      expect(Design.last.image.url).to be_present
      page.has_css?('class', text: "thumbnail")

      expect(Design.count).to eql(1)

      design = Design.first
      expect(design.user).to eql(user)
      expect(design.title).to eql('Brand spanking new design')
      expect(design.description).to eql('Best design youve ever seen')

      expect(design.image.current_path).to_not be_nil
    end
  end

  context 'as a guest' do
    scenario 'cannot access new design page' do
      visit new_design_path
      expect(page).to have_content('You need to sign in or sign up before continuing')
      expect(page).to_not have_content('Upload Your Design')
    end
  end
end
