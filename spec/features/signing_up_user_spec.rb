require "rails_helper"

RSpec.feature "A user signs up for an account" do
#############################################################################
###################### Tests using drawer nav links #########################
#############################################################################
  # Successful sign up
  scenario "A user successfully signs up for an account" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-drawer-sign-up")
    # enter email
    fill_in "Email", with: "user@example.com"
    # enter password
    fill_in "Password", with: "password"
    # enter password confirmation
    fill_in "Password confirmation", with: "password"
    # click sign up
    click_button("new-registration-button")
    # redirect
    expect(current_path).to eq(root_path)
    # expect success message
    expect(page).to have_content("Welcome! you have signed up successfully.")
  end

  # Unsuccessful sign-up due to blank email
  scenario "A user fails to sign up with blank email" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-drawer-sign-up")
    # enter blank email
    fill_in "Email", with: ""
    # enter password
    fill_in "Password", with: "password"
    # enter password confirmation
    fill_in "Password", with: "password"
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Email can't be blank")
  end

  # Unsuccessful sign-up due to blank email and password (expect multiple errors)
  scenario "A user fails to sign up with blank email and password" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-drawer-sign-up")
    # enter blank email
    fill_in "Email", with: ""
    # enter password
    fill_in "Password", with: ""
    # enter password confirmation
    fill_in "Password", with: ""
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  # Unsuccessful sign-up due to blank password
  scenario "A user fails to sign up with blank email and password" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-drawer-sign-up")
    # enter blank email
    fill_in "Email", with: "user@example.com"
    # enter password
    fill_in "Password", with: ""
    # enter password confirmation
    fill_in "Password", with: ""
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Password can't be blank")
  end

  # Unsuccessful sign-up due to mismatched passwords
  scenario "A user fails to sign up with mismatched password and password confirmations" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-drawer-sign-up")
    # enter blank email
    fill_in "Email", with: "user@example.com"
    # enter password
    fill_in "Password", with: "password"
    # enter password confirmation
    fill_in "Password", with: "pisswierd"
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  # Unsuccessful sign-up due to too short of password
  scenario "A user fails to sign up with a password under 6 characters long" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-drawer-sign-up")
    # enter blank email
    fill_in "Email", with: "user@example.com"
    # enter password
    fill_in "Password", with: "pass"
    # enter password confirmation
    fill_in "Password", with: "pass"
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

#############################################################################
###################### Tests using nav bar links ############################
#############################################################################
  # Successful sign up
  scenario "A user successfully signs up for an account" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-bar-sign-up")
    # enter email
    fill_in "Email", with: "user@example.com"
    # enter password
    fill_in "Password", with: "password"
    # enter password confirmation
    fill_in "Password confirmation", with: "password"
    # click sign up
    click_button("new-registration-button")
    # redirect
    expect(current_path).to eq(root_path)
    # expect success message
    expect(page).to have_content("Welcome! you have signed up successfully.")
  end

  # Unsuccessful sign-up due to blank email
  scenario "A user fails to sign up with blank email" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-bar-sign-up")
    # enter blank email
    fill_in "Email", with: ""
    # enter password
    fill_in "Password", with: "password"
    # enter password confirmation
    fill_in "Password", with: "password"
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Email can't be blank")
  end

  # Unsuccessful sign-up due to blank email and password (expect multiple errors)
  scenario "A user fails to sign up with blank email and password" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-bar-sign-up")
    # enter blank email
    fill_in "Email", with: ""
    # enter password
    fill_in "Password", with: ""
    # enter password confirmation
    fill_in "Password", with: ""
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  # Unsuccessful sign-up due to blank password
  scenario "A user fails to sign up with blank email and password" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-bar-sign-up")
    # enter blank email
    fill_in "Email", with: "user@example.com"
    # enter password
    fill_in "Password", with: ""
    # enter password confirmation
    fill_in "Password", with: ""
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Password can't be blank")
  end

  # Unsuccessful sign-up due to mismatched passwords
  scenario "A user fails to sign up with mismatched password and password confirmations" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-bar-sign-up")
    # enter blank email
    fill_in "Email", with: "user@example.com"
    # enter password
    fill_in "Password", with: "password"
    # enter password confirmation
    fill_in "Password", with: "pisswierd"
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  # Unsuccessful sign-up due to too short of password
  scenario "A user fails to sign up with a password under 6 characters long" do
    # visit root
    visit "/"
    # click on sign-up link
    click_link("nav-bar-sign-up")
    # enter blank email
    fill_in "Email", with: "user@example.com"
    # enter password
    fill_in "Password", with: "pass"
    # enter password confirmation
    fill_in "Password", with: "pass"
    # click sign up
    click_button("new-registration-button")
    # expect failure message
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
  end

end
