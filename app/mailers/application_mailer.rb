# frozen_string_literal: true

# Base class for all application mailer
# :nocov:
class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('DEVISE_MAILER_FROM', nil)
  layout 'mailer'
end
# :nocov:
