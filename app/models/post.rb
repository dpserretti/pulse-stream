# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :tenant
  has_rich_text :content
  validates :title, presence: true
end
