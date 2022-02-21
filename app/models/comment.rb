# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :body, presence: true
  validates :commentor, presence: true
end
