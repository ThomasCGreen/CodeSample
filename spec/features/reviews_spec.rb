require 'spec_helper'

feature 'Reviews' do
  scenario 'allows user to create a review' do
    @user = FactoryGirl.create(:user)
    @category = Category.new
    @category.title = "Resources"
    @category.save

    @category1 = Category.new
    @category1.title = "Flooring"
    @category1.category_id = @category.id
    @category1.save

    @category2 = Category.new
    @category2.title = 'Hardwood'
    @category2.category_id = @category1.id
    @category2.save

    @business = FactoryGirl.create(:business)
    @business.category_id = @category1.id

    visit '/'
    click_link 'Log In'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'

    within("//li[@id='#{@category1.title}_#{@category1.id}']") do
      first(:link, "Show Businesses").click
    end

    click_link 'Add Review'

    fill_in 'Business', with: business_name
    fill_in 'Contact Name', with: contact_name
    fill_in 'Service or Product', with: product_name
    fill_in 'Phone Number', with: phone_number
    fill_in 'Website', with: website
    fill_in 'email', with: email
    fill_in 'Street', with: street
    fill_in 'City', with: city
    fill_in 'State', with: state
    fill_in 'Zip', with: zip

    click_button 'Create New Review'

    expect(page).to have_text(business_name)
    expect(page).to have_text(contact_name)
    expect(page).to have_text(product_name)
    expect(page).to have_text(phone_number)
    expect(page).to have_text(website)
    expect(page).to have_text(email)
    expect(page).to have_text(street)
    expect(page).to have_text(city)
    expect(page).to have_text(state)
    expect(page).to have_text(zip)
  end
end