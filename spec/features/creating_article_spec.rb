require "rails_helper"

RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    # Visit root
    visit "/"
    # Click new article link
    click_link "New Article"
    # Fill in title of article
    fill_in "Title", with: "Creating a blog"
    # Fill in the body of the article
    fill_in "Body", with: "Lorem Ipsum Sit Dolar Amet..."
    # Create article
    click_button "Create Article"

    # expect success message
    expect(page).to have_content("Article has been created successfully")
    # Redirects to the articles path (where the article is listed)
    expect(page).to eq(articles_path)
  end
end
