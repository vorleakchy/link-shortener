require 'rails_helper'

feature 'User edits short link' do
  scenario 'they see info' do
    short_link = create(:short_link)
    visit edit_short_link_path(short_link)

    expect(page).to have_content('View Count')
    expect(page).to have_content('Shortened URL')
  end

  scenario 'they click expire button' do
    short_link = create(:short_link)
    visit edit_short_link_path(short_link)

    click_button 'Expire'

    expect(page).to have_content('Short link was successfully expired.')
  end

  scenario 'with expired short link' do
    short_link = create(:short_link, :expired)
    visit edit_short_link_path(short_link)

    expect(page).to have_content('This shortened URL is expired.')
  end
end
