require 'spec_helper'

feature 'user visits the homepage' do
  scenario 'user is welcomed to the site' do
    visit root_path
    expect(page).to have_content "WDYGo"
  end
end