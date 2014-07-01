require 'spec_helper'

feature 'users visits the homepage' do
  scenario 'users is welcomed to the site' do
    visit root_path
    expect(page).to have_content "WDYGo"
  end
end