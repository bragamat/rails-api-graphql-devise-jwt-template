user = User.create(
  email: ENV.fetch('ADMIN_EMAIL', nil),
  password: ENV.fetch('ADMIN_PASSWORD', nil),
  password_confirmation: ENV.fetch('ADMIN_PASSWORD', nil),
  first_name: ENV.fetch('ADMIN_FIRST_NAME', nil),
  last_name: ENV.fetch('ADMIN_LAST_NAME', nil),
  role: 'superadmin'
)

Rails.logger.info "Login with #{ENV.fetch('ADMIN_EMAIL', nil)} and #{ENV.fetch('ADMIN_PASSWORD', nil)}" if user

# Create a admin user
admin = User.create(
  email: 'admin@template.com',
  password: ENV.fetch('ADMIN_PASSWORD', nil),
  password_confirmation: ENV.fetch('ADMIN_PASSWORD', nil),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  role: 'admin'
)

User.create(
  email: Faker::Internet.email,
  password: ENV.fetch('ADMIN_PASSWORD', nil),
  password_confirmation: ENV.fetch('ADMIN_PASSWORD', nil),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  role: 'user'
)

User.create(
  email: Faker::Internet.email,
  password: ENV.fetch('ADMIN_PASSWORD', nil),
  password_confirmation: ENV.fetch('ADMIN_PASSWORD', nil),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  role: 'user'
)
