class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true
  validates :commentor, presence: true
end
