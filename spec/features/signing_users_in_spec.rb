require "rails_helper"

RSpec.feature "Users Sign in" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
  end
  #######################################################
  ############### nav bar links #########################
  #######################################################

  scenario "with valid credentials" do
    visit "/"

    click_link ("nav-bar-sign-in")

    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password

    click_button("sign-in-submit-btn")

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@john.email}")
    expect(page).to have_link("nav-bar-current-user-show")
    expect(page).not_to have_link("nav-bar-sign-in")
    expect(page).not_to have_link("nav-bar-sign-up")
  end

  scenario "with bad password" do
    visit "/"

    click_link ("nav-bar-sign-in")

    fill_in "Email", with: @john.email
    fill_in "Password", with: ""

    click_button("sign-in-submit-btn")

    expect(page).to have_content("Invalid email or password.")
    expect(page).to have_content("Alert")
    expect(page).to have_link("nav-bar-sign-in")
    expect(page).to have_link("nav-bar-sign-up")
  end

  scenario "with bad email" do
    visit "/"

    click_link ("nav-bar-sign-in")

    fill_in "Email", with: ""
    fill_in "Password", with: @john.password

    click_button("sign-in-submit-btn")

    expect(page).to have_content("Invalid email or password.")
    expect(page).to have_content("Alert")
    expect(page).to have_link("nav-bar-sign-in")
    expect(page).to have_link("nav-bar-sign-up")
  end

  scenario "with no email or password" do
    visit "/"

    click_link ("nav-bar-sign-in")

    fill_in "Email", with: ""
    fill_in "Password", with: ""

    click_button("sign-in-submit-btn")

    expect(page).to have_content("Invalid email or password.")
    expect(page).to have_content("Alert")
    expect(page).to have_link("nav-bar-sign-in")
    expect(page).to have_link("nav-bar-sign-up")
  end

  ################################################################
  ############### nav drawer links ###############################
  ################################################################
  scenario "with valid credentials" do
    visit "/"

    click_link ("nav-drawer-sign-in")

    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password

    click_button("sign-in-submit-btn")

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@john.email}")
    expect(page).to have_link("nav-drawer-current-user-show")
    expect(page).not_to have_link("nav-drawer-sign-in")
    expect(page).not_to have_link("nav-drawer-sign-up")
  end

  scenario "with bad password" do
    visit "/"

    click_link ("nav-drawer-sign-in")

    fill_in "Email", with: @john.email
    fill_in "Password", with: ""

    click_button("sign-in-submit-btn")

    expect(page).to have_content("Invalid email or password.")
    expect(page).to have_content("Alert")
    expect(page).to have_link("nav-drawer-sign-in")
    expect(page).to have_link("nav-drawer-sign-up")
  end

  scenario "with bad email" do
    visit "/"

    click_link ("nav-drawer-sign-in")

    fill_in "Email", with: ""
    fill_in "Password", with: @john.password

    click_button("sign-in-submit-btn")

    expect(page).to have_content("Invalid email or password.")
    expect(page).to have_content("Alert")
    expect(page).to have_link("nav-drawer-sign-in")
    expect(page).to have_link("nav-drawer-sign-up")
  end

  scenario "with no email or password" do
    visit "/"

    click_link ("nav-drawer-sign-in")

    fill_in "Email", with: ""
    fill_in "Password", with: ""

    click_button("sign-in-submit-btn")

    expect(page).to have_content("Invalid email or password.")
    expect(page).to have_content("Alert")
    expect(page).to have_link("nav-drawer-sign-in")
    expect(page).to have_link("nav-drawer-sign-up")
  end

end
