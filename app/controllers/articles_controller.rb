# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: [:show]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def delete; end

  def edit; end

  def update; end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find_by_id(params[:id])
  end
end
