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
    expect(page).to have_text('Signed in as TomG@AccelHomeBuyers.com')
  end
end
