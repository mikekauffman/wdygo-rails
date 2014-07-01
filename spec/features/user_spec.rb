require 'spec_helper'

feature 'Users join the site' do
  scenario 'Users can register to the site' do
    visit root_path
    click_on 'Register'
    fill_in 'First name', with: 'Mike'
    fill_in 'Last name', with: 'Kauffman'
    fill_in 'Email', with: 'goin2na@hotmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign Up'
    expect(page).to have_content 'Welcome, Mike'
  end
end