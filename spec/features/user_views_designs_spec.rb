require 'spec_helper'

feature 'user browses list of designs', %q{
  As a user
  I want to browse designs
  So that I can find ones I'm interested in
} do

  scenario 'user sees list of design titles' do
    designs = FactoryGirl.create_list(:design, 5)

    visit root_path

    designs.each do |design|
      expect(page).to have_content(design.title)
    end
  end
end
