require "rails_helper"

RSpec.feature "Editing an article" do
  # create article for use in scenario
  before do
    @article = Article.create(title: "Initial Title", body: "Initial article body.")
  end

  scenario "A user updates an article title" do
    # start at root
    visit "/"
    # navigate to article show
    click_link @article.title
    # click link to edit article
    click_link "Edit Article"
    # edit title
    fill_in "Title", with: "New Title"
    # click update button
    click_button "Update Article"
    # expect page to have success message
    expect(page).to have_content("Article updated successfully")
    # expect page path to be the article show page
    expect(page.current_path).to eq(article_path(@article))
    # expect page to have updated title
    expect(page).to have_content("New Title")
  end

  scenario "A user updates an article body" do
    # start at root
    visit "/"
    # navigate to article show
    click_link @article.title
    # click link to edit article
    click_link "Edit Article"
    # edit title
    fill_in "Body", with: "New Article Body."
    # click update button
    click_button "Update Article"
    # expect page to have success message
    expect(page).to have_content("Article updated successfully")
    # expect page path to be the article show page
    expect(page.current_path).to eq(article_path(@article))
    # expect page to have updated title
    expect(page).to have_content("New Article Body.")
  end

  scenario "A user fails to update an article title" do
    # start at root
    visit "/"
    # navigate to article show
    click_link @article.title
    # click link to edit article
    click_link "Edit Article"
    # edit title
    fill_in "Title", with: ""
    # click update button
    click_button "Update Article"
    # expect page to have error message
    expect(page).to have_content("Title can't be blank")
  end

  scenario "A user fails to update an article body" do
    # start at root
    visit "/"
    # navigate to article show
    click_link @article.title
    # click link to edit article
    click_link "Edit Article"
    # edit title
    fill_in "Body", with: ""
    # click update button
    click_button "Update Article"
    # expect page to have error message
    expect(page).to have_content("Body can't be blank")
  end

end
