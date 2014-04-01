require 'spec_helper'

feature 'Recommendations Categories' do
  scenario 'allows user to create the first category' do
    @user = FactoryGirl.create(:user)

    visit '/'

    expect(page).to have_link('Log In')

    click_link 'Log In'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'

    expect(page).to have_text('Add Category')

    click_link 'Add Category'

    fill_in 'Title', with: 'Lenders'

    click_button 'Create New Category'

    expect(page).to have_text('The following are resources you can explore')
    expect(page).to have_text('Lenders')
  end
end
