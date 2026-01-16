# app/models/current.rb
# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :tenant
end
