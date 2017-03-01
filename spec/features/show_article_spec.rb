require "rails_helper"

RSpec.feature "Show Article" do
# Create an article for user to show
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @article = Article.create(title: "Article Title", body: "This is some article body content", user: @john)
  end

  scenario "A non signed in user shows an article" do
    # visit root
    visit "/"

    # click the title link
    click_link @article.title

    # expect the page to have article title
    expect(page).to have_content(@article.title)

    # expect the page to have article body
    expect(page).to have_content(@article.body)

    # expect page to have article updated at time
    expect(page).to have_content(@article.updated_at.strftime("%B %e, %Y"))

    # expect the current_path to be the same as the article that's created
    expect(current_path).to eq(article_path(@article))

    # expect page not to have edit or delete links
    expect(page).not_to have_link("Edit")
    expect(page).not_to have_link("Delete")
  end

  scenario "A signed in user shows an article they don't own" do
    login_as(@fred)
    # visit root
    visit "/"

    # click the title link
    click_link @article.title

    # expect the page to have article title
    expect(page).to have_content(@article.title)

    # expect the page to have article body
    expect(page).to have_content(@article.body)

    # expect page to have article updated at time
    expect(page).to have_content(@article.updated_at.strftime("%B %e, %Y"))

    # expect the current_path to be the same as the article that's created
    expect(current_path).to eq(article_path(@article))

    # expect page not to have edit or delete links
    expect(page).not_to have_link("Edit")
    expect(page).not_to have_link("Delete")
  end

  scenario "A signed in user shows an article they own" do
    login_as(@john)
    # visit root
    visit "/"

    # click the title link
    click_link @article.title

    # expect the page to have article title
    expect(page).to have_content(@article.title)

    # expect the page to have article body
    expect(page).to have_content(@article.body)

    # expect page to have article updated at time
    expect(page).to have_content(@article.updated_at.strftime("%B %e, %Y"))

    # expect the current_path to be the same as the article that's created
    expect(current_path).to eq(article_path(@article))

    # expect page not to have edit or delete links
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
  end

end
