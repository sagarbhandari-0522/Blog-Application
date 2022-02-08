# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments
  validates :title, presence: true
  validates :description, presence: true
end
