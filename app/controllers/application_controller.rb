# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :set_current_tenant

  private

  # Sets the global tenant context based on the request subdomain
  def set_current_tenant
    return if request.subdomain.blank? || request.subdomain == 'www'

    Current.tenant = Tenant.find_by!(subdomain: request.subdomain)
  end
end
