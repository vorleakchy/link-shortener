require 'rails_helper'

feature 'User creates short link' do
  scenario 'with valid original url' do
    create_short_link_with 'https://www.example.com/path'

    expect(page).to have_content('Shortened URL')
    expect(page).to have_content('Admin URL')
    expect(page).to have_content('Short link was successfully created.')
  end

  scenario 'with invalid original url' do
    create_short_link_with 'invalid-url'

    expect(page).to have_content('Original url must be a valid URL')
  end

  def create_short_link_with(original_url)
    visit root_path
    fill_in 'short_link_original_url', with: original_url
    click_button 'Shorten'
  end
end
