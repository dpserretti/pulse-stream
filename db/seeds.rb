# frozen_string_literal: true

# This file contains the initial data required to run the application in development.
# It creates a default tenant and an admin user for testing purposes.

Rails.logger.info "\n== Seeding Database =="

# 1. Create a Primary Tenant
# We use 'streamer' as a subdomain to test http://streamer.lvh.me:3000
tenant = Tenant.find_or_create_by!(subdomain: 'streamer') do |t|
  t.name = 'Pro Streamer Studio'
end
Rails.logger.info "Created Tenant: #{tenant.name} (#{tenant.subdomain})"

# 2. Create a User for this Tenant
# The user must be associated with the tenant created above.
User.find_or_create_by!(email: 'admin@pulsestream.com') do |user|
  user.tenant = tenant
  user.password = 'password123'
  user.password_confirmation = 'password123'
end
Rails.logger.info 'Created User: admin@pulsestream.com (Password: password123)'

Rails.logger.info "== Seeding Completed Successfully ==\n"
