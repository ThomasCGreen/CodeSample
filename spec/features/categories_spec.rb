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

    expect(page).to have_text('Resources')
    expect(page).to have_text('Add Category')

    click_link 'Add Category'

    fill_in 'Title', with: 'Lenders'

    click_button 'Create New Category'

    expect(page).to have_text('The following are resources you can explore')
    expect(page).to have_text('Lenders')
  end

  scenario 'allows user to create the second category' do
    @user = FactoryGirl.create(:user)
    @category = Category.new
    @category.title = "Resources"
    @category.save

    @category1 = Category.new
    @category1.title = "Flooring"
    @category1.category_id = @category.id
    @category1.save

    @category2 = FactoryGirl.create(:category)
    @category2.category_id = @category1.id
    @category2.save

    visit '/'
    click_link 'Log In'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'

    within("//li[@id='#{@category1.title}_#{@category1.id}']") do
      first(:link, "Add Category").click
    end

    fill_in 'Title', with: 'Lenders'

    click_button 'Create New Category'

    expect(page).to have_text('The following are resources you can explore')
    expect(page).to have_text('Lenders')
    expect(page).to have_text(@category1.title)
    expect(page).to have_text(@category2.title)
  end
end
