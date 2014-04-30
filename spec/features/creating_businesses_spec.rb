require 'spec_helper'

feature 'Business Information' do
  scenario 'allows user to create a business' do
    @user = FactoryGirl.create(:user)
    resources = FactoryGirl.create(:category, title: 'Resources', category_id: nil)
    flooring = FactoryGirl.create(:category, title: 'Flooring', category_id: resources.id)
    hardwood = FactoryGirl.create(:category, title: 'Hardwood', category_id: flooring.id)

    visit '/'
    click_link 'Log In'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'

    within("//li[@id='#{flooring.title}_#{flooring.id}']") do
      first(:link, "Add Business").click
    end

    business = FactoryGirl.build(:business)

    fill_in 'Business', with: business.name
    fill_in 'Contact Name', with: business.contact
    fill_in 'Service or Product', with: business.product
    fill_in 'Phone Number', with: business.phone
    fill_in 'Website', with: business.website
    fill_in 'email', with: business.email
    fill_in 'Street', with: business.street
    fill_in 'City', with: business.city
    fill_in 'State', with: business.state
    fill_in 'Zip', with: business.zip

    click_button 'Create New Business'

    expect(page).to have_text(business.name)
    expect(page).to have_text(business.contact)
    expect(page).to have_text(business.product)
    expect(page).to have_text(business.phone)
    expect(page).to have_text(business.website)
    expect(page).to have_text(business.email)
    expect(page).to have_text(business.street)
    expect(page).to have_text(business.city)
    expect(page).to have_text(business.state)
    expect(page).to have_text(business.zip)

    click_link 'Return to Resources'
    expect(page).to have_text('Flooring(1)')
  end
end
