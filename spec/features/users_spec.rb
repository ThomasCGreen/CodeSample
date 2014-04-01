require 'spec_helper'

feature 'User Authentication' do
  scenario 'allows a user to create a new account' do
    visit '/'

    expect(page).to have_link('Click Here to Create a New Account')

    click_link 'Click Here to Create a New Account'

    fill_in 'First name', with: 'Tom'
    fill_in 'Last name', with: 'Green'
    fill_in 'Email', with: 'TomG@AccelHomeBuyers.com'
    fill_in 'Password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    fill_in 'Street', with: '20910 Main Street'
    fill_in 'City', with: 'Padroni'
    fill_in 'State', with: 'CO'
    fill_in 'Zip', with: '80745'
    fill_in 'Cell phone', with: '720-318-5445'

    click_button 'Sign Up'

    expect(page).to have_text('Thank you for signing up, Tom!')
    expect(page).to have_text('The following are resources you can explore')
    expect(page).to have_text('Signed in as TomG@AccelHomeBuyers.com')
  end

  scenario 'allows existing user to log in' do
    @user = FactoryGirl.create(:user)

    visit '/'

    expect(page).to have_link('Log In')

    click_link 'Log In'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'

    expect(page).to have_text("Welcome back #{@user.first_name}")
    expect(page).to have_text('The following are resources you can explore')
    expect(page).to have_text("Signed in as #{@user.email}")
  end

  scenario 'does not allow existing users to login with invalid password' do
    @user = FactoryGirl.create(:user)

    visit '/'

    expect(page).to have_link('Log In')

    click_link 'Log In'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'WrongPassword'

    click_button 'Sign In'

    expect(page).to have_text('Invalid email or password')
  end

  scenario 'allow a logged in user to log out' do
    @user = FactoryGirl.create(:user)

    # Log the user in
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    visit '/'

    expect(page).to have_text("Signed in as #{@user.email}")
    expect(page).to have_link('Log Out')

    click_link 'Log Out'

    expect(page).to have_text("#{@user.email} has been logged out.")
    expect(page).to_not have_text("Welcome back #{@user.first_name}")
    expect(page).to_not have_text('following are resources you can explore')
    expect(page).to_not have_text("Signed in as #{@user.email}")
  end
end
