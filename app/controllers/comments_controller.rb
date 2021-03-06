class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    unless user_signed_in?
      flash[:alert] = "Please sign in or sign up first"
      redirect_to new_user_session_path
    else
      if @comment.save
        flash.now[:notice] = "Comment has been created"
        ActionCable.server.broadcast "comments",
          render(partial: 'comments/comment', object: @comment)
      else
        flash.now[:alert] = "Comment has not been created"
        redirect_to article_path(@article)
      end

    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

end
