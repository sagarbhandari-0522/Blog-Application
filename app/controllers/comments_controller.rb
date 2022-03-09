class CommentsController < ApplicationController
  before_action :find_article, only: %i[create destroy edit update]
  before_action :find_comment, only: %i[edit destroy update]
  before_action :authenticate_user!
  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      puts '*' * 50
      render 'articles/show'
    end
  end

  def edit
    render 'articles/show'
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
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
