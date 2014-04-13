require 'spec_helper'

feature 'Home Page' do
  scenario 'Home Page is present' do
    visit '/'

    expect(page).to have_content('Welcome to eCAREI Resource Pages!')
  end

  scenario 'Home Page has link for Creating a New Account' do
    visit '/'
    expect(page).to have_content('Click Here to Create a New Account')
  end
end
