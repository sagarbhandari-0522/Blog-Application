class CommentsController < ApplicationController
  before_action :find_article, only: %i[create destroy]
  before_action :find_comment, only: %i[destroy]

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      @comment.save
      redirect_to article_path(@article)
    else
      puts '*' * 50
      render 'articles/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commentor, :body)
  end

  def find_article
    @article = Article.find_by_id(params[:article_id])
  end

  def find_comment
    @comment = Comment.find_by_id(params[:id])
  end
end
