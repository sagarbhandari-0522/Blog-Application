# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :delete_all
  validates :title, presence: true
  validates :description, presence: true
end
