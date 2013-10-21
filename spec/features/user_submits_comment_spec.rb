require 'spec_helper'

feature 'user submits a comment for a design', %q{
  As a user
  I want to browse designs
  So that I can find ones I'm interested in
} do

  context 'user logged-in' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      sign_in_as user
    end

    scenario 'user submit valid comment' do
      design = FactoryGirl.create(:design, :with_image)

      visit design_path(design)

      fill_in 'Comment on this design:', with: 'Cool design, bro.'
      click_button 'Create Comment'

      expect(page).to have_content('Comment successfully added.')
      expect(design.comments.last.body).to eql('Cool design, bro.')
    end

    scenario 'user submits blank comment' do
      design = FactoryGirl.create(:design, :with_image)
      prev_count = design.comments.count

      visit design_path(design)

      fill_in 'Comment on this design:', with: ''
      click_button 'Create Comment'

      expect(page).to have_content('There was an error. Your comment did not
        save.')
      expect(design.comments.count).to eql(prev_count)
    end
  end

  context 'user not logged-in' do

    scenario 'user tries to submit comment' do
      design = FactoryGirl.create(:design, :with_image)
      prev_count = design.comments.count

      visit design_path(design)

      fill_in 'Comment on this design', with: 'Cool design, bro.'

      click_on 'Create Comment'
      redirect_to new_user_session_path

      expect(page).to have_content('You need to sign in or sign up before
        continuing.')
      expect(design.comments.count).to eql(prev_count)
    end
  end

end
