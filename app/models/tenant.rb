# app/models/tenant.rb
# frozen_string_literal: true

class Tenant < ApplicationRecord
  # Establish the relationship with posts
  # dependent: :destroy ensures that if a tenant is deleted, their posts are too
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true
end
