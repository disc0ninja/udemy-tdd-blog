require "rails_helper"

RSpec.feature "A user signs out" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")

    visit "/"

    click_link ("nav-bar-sign-in")

    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password

    click_button("sign-in-submit-btn")
  end

  #################################################
  ####### using nav bar links #####################
  #################################################
  scenario "A user signs out successfully from header nav" do
    visit "/"

    click_link "nav-bar-sign-out"

    expect(page).to have_content("Signed out successfully")
    expect(page).not_to have_content("Sign out")
  end

  #################################################
  ####### using nav drawer links #####################
  #################################################
  scenario "A user signs out successfully" do
    visit "/"

    click_link "nav-drawer-sign-out"

    expect(page).to have_content("Signed out successfully")
    expect(page).not_to have_content("Sign out")
  end

end
