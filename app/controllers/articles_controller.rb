# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
    render 'edit'
  end

  def update
    @article.user_id = current_user.id
    authorize @article

    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @article.destroy
    authorize @article
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find_by_id(params[:id])
  end
end
