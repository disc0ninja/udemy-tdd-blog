require "rails_helper"

RSpec.feature "Creating Articles" do
  scenario "A user creates the first link to create a new article" do
    # Visit root
    visit "/"
    # Click new article link
    first(:link, "New Article").click
    # Fill in title of article
    fill_in "Title", with: "Creating a blog"
    # Fill in the body of the article
    fill_in "Body", with: "Lorem Ipsum Sit Dolar Amet..."
    # Create article
    click_button "Create Article"

    # expect success message
    expect(page).to have_content("Article has been created successfully")
    # Redirects to the articles path (where the article is listed)
    expect(current_path).to eq("/articles")
  end

  scenario "A user fails to create a new article without a title or body" do
    # Visit root
    visit "/"
    # Click new article link
    first(:link, "New Article").click
    # Fill in title of article
    fill_in "Title", with: ""
    # Fill in the body of the article
    fill_in "Body", with: ""
    # Create article
    click_button "Create Article"

    # expect faiure messages
    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end

  scenario "A user fails to create a new article without a title" do
    # Visit root
    visit "/"
    # Click new article link
    first(:link, "New Article").click
    # Fill in title of article
    fill_in "Title", with: ""
    # Fill in the body of the article
    fill_in "Body", with: "asdf asdf asdf asdf asdf asdf asdf"
    # Create article
    click_button "Create Article"

    # expect faiure messages
    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_no_content("Body can't be blank")
  end

  scenario "A user fails to create a new article without a body" do
    # Visit root
    visit "/"
    # Click new article link
    first(:link, "New Article").click
    # Fill in title of article
    fill_in "Title", with: "asdf"
    # Fill in the body of the article
    fill_in "Body", with: ""
    # Create article
    click_button "Create Article"

    # expect faiure messages
    expect(page).to have_content("Article has not been created")
    expect(page).to have_no_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end

end
