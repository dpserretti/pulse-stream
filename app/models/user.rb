# app/models/user.rb
# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :tenant

  # Validations
  validates :email, presence: true
  validates :email, format: { with: Devise.email_regexp }
  validates :password, presence: true, length: { within: Devise.password_length }, if: :password_required?

  # Scoped uniqueness validation: Allow same email in different tenants
  validates :email, uniqueness: { scope: :tenant_id, case_sensitive: false }

  # Scoping all queries to the current tenant context
  default_scope -> { where(tenant_id: Current.tenant&.id) if Current.tenant.present? }

  private

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
