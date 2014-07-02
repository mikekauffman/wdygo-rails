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

  scenario 'Users can login to the site with a valid email/password' do
    User.create!(first_name: "Mike", last_name: "Kauffman", email: "goin2na@hotmail.com", password: "password")
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'goin2na@hotmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Login'
    expect(page).to have_content 'Login Successful'
    expect(page).to have_content 'Welcome, Mike'
  end

  scenario 'Users cannot login to the site with the wrong email/password' do
    User.create!(first_name: "Mike", last_name: "Kauffman", email: "goin2na@hotmail.com", password: "password")
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'goin2naples@hotmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Login'
    expect(page).to have_content 'Invalid Email and Password Combination'

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'goin2na@hotmail.com'
    fill_in 'Password', with: 'password123'
    click_on 'Login'
    expect(page).to have_content 'Invalid Email and Password Combination'
  end

  scenario 'Users can logout' do
    User.create!(first_name: "Mike", last_name: "Kauffman", email: "goin2na@hotmail.com", password: "password")
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'goin2na@hotmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Login'
    expect(page).to have_content 'Welcome, Mike'
    click_on 'Logout'
    expect(page).to have_content 'Logout Successful'
    expect(page).to_not have_content 'Welcome Mike'
  end
end