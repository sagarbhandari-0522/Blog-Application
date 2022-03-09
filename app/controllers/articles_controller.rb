# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
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
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @article.destroy
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
