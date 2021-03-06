require "rails_helper"

RSpec.describe "Comments", type: :request do
  # create article for use in test case
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @article = Article.create!(title: "Title one", body: "Body of the article", user: @john)
  end

  describe 'POST /articles/:id/comments' do
    context 'with a non signed in user' do
      before do
        post "/articles/#{@article.id}/comments",
          params: { comment: { body: "Awesome Blog" } }
        end

      it "redirects user to the signin page" do
        flash_message = "Please sign in or sign up first"
        expect(response).to redirect_to(new_user_session_path)
        expect(response.status).to eq 302
        expect(flash[:alert]).to eq flash_message
      end
    end

    context "with a logged in user" do
      before do
        login_as(@fred)
        post "/articles/#{@article.id}/comments",
          params: { comment: { body: "Awesome Blog" } }
      end

      it "create comment successfully" do
        expect(response.status).to eq 200
      end
    end
  end

end
