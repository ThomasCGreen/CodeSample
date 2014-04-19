require 'spec_helper'

feature 'Home Page' do
  scenario 'Home Page is present' do
    visit '/'

    expect(page).to have_content('Welcome to eCAREI Resource Pages!')
  end
end
