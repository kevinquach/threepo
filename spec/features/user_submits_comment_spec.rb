require 'spec_helper'

feature 'user submits a comment for a design', %q{
  As a user
  I want to browse designs
  So that I can find ones I'm interested in
} do

  context 'user logged-in' do

    let(:user) { FactoryGirl.create(:user) }

    before :each do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end

    scenario 'user submit valid comment' do
      design = FactoryGirl.create(:design)
      prev_count = design.comments.count

      visit designs_path
      find('img.design').click

      fill_in 'Comment on this design:', with: 'Cool design, bro.'
      click_button 'Create Comment'

      expect(page).to have_content('Comment successfully added.')
      expect(design.comments.count).to eql(prev_count + 1)

      expect(design.comments.last.body).to eql('Cool design, bro.')
    end
  end

  context 'user not logged-in' do
    pending 'user tries to submit comment' do

      prev_count = Comment.count
      visit new_design_path
      current_design = FactoryGirl.create(:user)

      click_on image_tag

      fill_in 'Comment on this design', with: 'Cool design, bro.'

      click_on 'Create Comment'
      redirect to new_user_session_path
      expect(page).to have_content('You must be logged-in in order
        to submit comments. Please log-in first or sign up for a
        new account.')
      expect(Comment.count).to eql(prev_count)
    end
  end
end
