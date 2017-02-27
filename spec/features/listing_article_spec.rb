require "rails_helper"

RSpec.feature "Listing Articles" do
  # Create articles to display before scenario
  before do
  @article1 = Article.create(title: "The first article", body: "Lorem Ipsum dolar sit amet, consectetur.")

  @article2 = Article.create(title: "The second article", body: "Lorem Ipsum dolar sit amet, consectetur?")
  end

  #list two articles
  scenario "A user lists all articles" do
    visit "/"
  # expect both article titles to be present
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
  # expect both artilce bodies to be present
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
  # article titles shoudl be links
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end

  scenario "A user has no articles to list" do
    # Clear out created articles
    Article.delete_all
    visit "/"
  # expect both article titles to be present
    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)
  # expect both artilce bodies to be present
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)
  # article titles shoudl be links
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)
  # expect there to be a message explaingin no articles are created
    within("h3#no-articles") do
      expect(page).to have_content("No Articles Created Yet.")
    end
  end

end
