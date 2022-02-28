require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end
  def article_params(attributes)
    post articles_path, params: { article: attributes }
  end

  describe 'GET /index' do
    it 'should list all articles' do
      get articles_path
      expect(response).to have_http_status(:ok)
      # expect(response).to render_template(:index)
    end
  end
  describe 'GET/show' do
    it 'should not  show articles with invalid id' do
      expect { get article_path(100) }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it 'should show articles ' do
      article_params attributes_for(:article)
      get article_path(Article.first)
      expect(response).to have_http_status(200)
    end
  end
  describe 'POST/create' do
    it 'should create article' do
      article_params(attributes_for(:article))
      expect(response).to have_http_status(302)
    end
    it 'shouldnot  create article with empty title' do
      article = attributes_for(:article, title: nil)
      post articles_path, params: { article: article }
      expect(response).to have_http_status(422)
    end
  end
  describe 'POST/update' do
    it 'should update article' do
      create(:article, user: user)
      article1 = Article.find_by_id(1)
      article = attributes_for(:article, title: 'Helo world', description: 'I am fine bro')
      patch article_path(article1.id), params: { article: article }
      expect(response).to have_http_status(302)
    end
    it 'should not update article with empty title' do
      article_params attributes_for(:article)
      article = attributes_for(:article, title: nil)
      patch article_path(Article.first), params: { article: article }
      expect(response).to have_http_status(422)
    end
  end
  describe 'POST/destroy' do
    it 'should delete article' do
      article_params(attributes_for(:article))
      delete article_path(Article.first)
      expect(response).to have_http_status(303)
    end
    it 'should not delete article' do
      delete article_path(100)
      expect(response).to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
