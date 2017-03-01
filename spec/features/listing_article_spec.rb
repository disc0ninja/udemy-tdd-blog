require "rails_helper"

RSpec.feature "Listing Articles" do
  # Create articles to display before scenario
  before do
  @john = User.create(email: "john@example.com", password: "password")

  @article1 = Article.create(title: "The first article", body: "Lorem Ipsum dolar sit amet, consectetur.", user: @john)

  @article2 = Article.create(title: "The second article", body: "Lorem Ipsum dolar sit amet, consectetur?", user: @john)
  end

  scenario "A  not signed in user lists all articles with articles created" do
    visit "/"
    # expect user to have links to sign in and sign up
    expect(page).to have_link("article-index-sign-in")
    expect(page).to have_link("nav-bar-sign-up")
    expect(page).to have_link("nav-drawer-sign-in")

    # expect both article titles to be present
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)

    # expect both artilce bodies to be present
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)

    # article titles should be links
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)

    # expect page not to have new article links
    expect(page).not_to have_link("article-index-first-new-article-link")
    expect(page).not_to have_link("nav-bar-new-article-link")
    expect(page).not_to have_link("nav-drawer-new-article-link")

    # articles should have updated times
    expect(page).to have_content(@article1.updated_at.strftime("%B %e, %Y"))
    expect(page).to have_content(@article2.updated_at.strftime("%B %e, %Y"))
  end

  scenario "A not signed in user has no articles to list" do
    # Clear out created articles
    Article.delete_all
    visit "/"
    # expect user to have links to sign in and sign up
    expect(page).to have_link("article-index-sign-in")
    expect(page).to have_link("article-index-first-article-sign-up")
    expect(page).to have_link("article-index-first-article-sign-in")
    expect(page).to have_link("nav-bar-sign-up")
    expect(page).to have_link("nav-drawer-sign-in")

    # expect neither article to be present
    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)

    # expect both artilce bodies to be present
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)

    # article title links should not be present
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)

    # article should not have update times
    expect(page).not_to have_content(@article1.updated_at.strftime("%B %e, %Y"))
    expect(page).not_to have_content(@article2.updated_at.strftime("%B %e, %Y"))

    # expect page not to have new article links
    expect(page).not_to have_link("article-index-new-article-link")
    expect(page).not_to have_link("article-index-first-new-article-link")
    expect(page).not_to have_link("nav-bar-new-article-link")
    expect(page).not_to have_link("nav-drawer-new-article-link")

    # expect there to be a message explaining no articles are created
    within("h3#no-articles") do
      expect(page).to have_content("No Articles Created Yet.")
    end
  end


  #list two articles
  scenario "A signed in user lists all articles with articles created" do
    login_as(@john)
    visit "/"

    # expect user not to have links to sign in and sign up
    expect(page).not_to have_link("article-index-sign-in")
    expect(page).not_to have_link("nav-bar-sign-up")
    expect(page).not_to have_link("nav-drawer-sign-in")

    # expect both article titles to be present
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)

    # expect both artilce bodies to be present
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)

    # article titles should be links
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)

    # expect page to have new article links
    expect(page).to have_link("article-index-new-article-link")
    expect(page).to have_link("nav-bar-new-article-link")
    expect(page).to have_link("nav-drawer-new-article-link")

    # articles should have updated times
    expect(page).to have_content(@article1.updated_at.strftime("%B %e, %Y"))
    expect(page).to have_content(@article2.updated_at.strftime("%B %e, %Y"))
  end

  scenario "A signed in user has no articles to list" do
    login_as(@john)
    # Clear out created articles
    Article.delete_all
    visit "/"

    # expect user not to have links to sign in and sign up
    expect(page).not_to have_link("article-index-sign-in")
    expect(page).not_to have_link("article-index-first-article-sign-up")
    expect(page).not_to have_link("article-index-first-article-sign-in")
    expect(page).not_to have_link("nav-bar-sign-up")
    expect(page).not_to have_link("nav-drawer-sign-in")
    

    # expect neither article to be present
    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)

    # expect both artilce bodies to be present
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)

    # article title links should not be present
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)

    # article should not have update times
    expect(page).not_to have_content(@article1.updated_at.strftime("%B %e, %Y"))
    expect(page).not_to have_content(@article2.updated_at.strftime("%B %e, %Y"))

    # expect there to be a message explaining no articles are created
    within("h3#no-articles") do
      expect(page).to have_content("No Articles Created Yet.")
    end

    # expect page to have new article links
    expect(page).to have_link("article-index-new-article-link")
    expect(page).to have_link("article-index-first-new-article-link")
    expect(page).to have_link("nav-bar-new-article-link")
    expect(page).to have_link("nav-drawer-new-article-link")
  end

end
