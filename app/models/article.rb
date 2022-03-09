# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :delete_all
  belongs_to :user
  has_one_attached :header_image
  has_many_attached :uploads
  validates :title, presence: true
  validates :description, presence: true
end
