require 'spec_helper'

feature 'users visit the homepage' do
  scenario 'users are welcomed to the site' do
    visit root_path
    expect(page).to have_content "WDYGo"
  end
end