require 'spec_helper'

feature 'Reviews' do
  scenario 'allows user to create a review' do
    @user = FactoryGirl.create(:user)
    resources = FactoryGirl.create(:category, title: 'Resources', category_id: nil)
    flooring = FactoryGirl.create(:category, title: 'Flooring', category_id: resources.id)
    hardwood = FactoryGirl.create(:category, title: 'Hardwood', category_id: flooring.id)
    FactoryGirl.create(:business, category_id: flooring.id)

    visit '/'
    click_link 'Log In'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'

    within("//li[@id='#{flooring.title}_#{flooring.id}']") do
      first(:link, "Show Businesses").click
    end

    click_link 'Add Review'

    select '3', from: 'Business Rating'
    fill_in 'Review Text', with: 'Random Text'

    click_button 'Create New Review'

    expect(page).to have_text('3')
    expect(page).to have_text('Random Text')
  end
end