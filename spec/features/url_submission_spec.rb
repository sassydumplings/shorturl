require 'rails_helper'

feature "short url creation" do
  scenario "User creates a new short url" do
    visit "/short_urls/new"

    fill_in "Full", with: "http://www.google.com"
    click_button "Create Short url"

    expect(page).to have_text("http://www.google.com")
  end
end