namespace :bugsnag do
  desc "Extract exception event user names from bugsnag error url"
  task :error_users, [:error_url] => :environment do |t, args|
    unless bugsnag_token_present?
      puts "Aborting! Bugsnag::Api.configuration.auth_token must be set. See the bugsnag-error-users README."
      abort
    end

    fetcher = BugsnagErrorUsers::Fetcher.new(args.error_url)
    user_names = fetcher.fetch

    user_names.each do |user_name|
      puts user_name
    end
    puts "\nFetched #{user_names.size} results"
  end

  private

  def bugsnag_token_present?
    Bugsnag::Api.configuration.auth_token.present?
  end
end
