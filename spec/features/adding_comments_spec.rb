require "rails_helper"

RSpec.feature "Adding comments to Articles" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @article = Article.create(title: "Article Title", body: "This is some article body content", user: @john)
  end

  scenario "Permits a signed in user to write a comment" do
    login_as @fred

    visit "/"

    click_link @article.title

    fill_in "New Comment", with: "An amazing article"
    click_button "Add Comment"

    expect(page).to have_content("An amazing article")
    expect(current_path).to eq(article_comments_path(@article.id))
  end

end
