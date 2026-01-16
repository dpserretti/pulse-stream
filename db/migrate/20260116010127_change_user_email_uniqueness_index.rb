# frozen_string_literal: true

class ChangeUserEmailUniquenessIndex < ActiveRecord::Migration[8.1]
  def change
    remove_index :users, :email
    add_index :users, [:email, :tenant_id], unique: true
  end
end