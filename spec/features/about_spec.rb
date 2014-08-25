require "rails_helper"

describe "viewing the about page" do
  it "shows the page to non-logged in users" do
    visit root_path

    click_on "About"

    expect(page).to have_content("Not much to see here")
  end
end
