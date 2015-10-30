require "rails"

class BugsnagErrorUsers::Railtie < Rails::Railtie
  railtie_name :bugsnag_error_users

  rake_tasks do
    load "tasks/bugsnag-error-users.rake"
  end
end
