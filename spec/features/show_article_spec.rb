require "rails_helper"

RSpec.feature "Show Article" do
# Create an article for user to show
  before do
    @article = Article.create(title: "Article Title", body: "This is some article body content")
  end

  scenario "A user shows an article" do
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
  end

end
