require 'rails_helper'
user = User.first

RSpec.describe Article, type: :model do
  it 'Title Presence' do
    article = Article.new(title: '', description: 'lorem dfjfjkl djlakdfjla', user: user)
    expect(article).to_not be_valid
    article.title = 'Hello'
    expect(article).to be_valid
  end
  it 'Description Presence' do
    article = Article.new(title: 'adasd', description: '', user: user)
    expect(article).to_not be_valid
    article.description = 'Hello'
    expect(article).to be_valid
  end
end
