require 'bugsnag/api'

module BugsnagErrorUsers
  class Fetcher
    PAGE_SIZE = 100

    attr_reader :error_url

    def initialize(error_url)
      @error_url = error_url
    end

    def fetch
      error_id = error_id_from_url(error_url)

      if error_id.nil?
        puts "Invalid Bugsnag error URL. Example: https://bugsnag.com/<organization>/<project_name>/errors/<error_id>"
        return []
      end

      print "Fetching user names from error id: #{error_id}. (Each '.' is an event page fetched): "
      events = fetch_events(error_id)
      puts "\n"
      extract_usernames(events)
    end

    private

    def error_id_from_url(raw_url)
      parsed_url = URI.parse(raw_url)
      match = /errors\/([a-f0-9]+)/.match(parsed_url.path)
      match[1] if match && match[1]
    end

    def fetch_events(error_id)
      events, results_size = fetch_events_page(error_id, per_page: PAGE_SIZE)
      return events if results_size < PAGE_SIZE

      until results_size < PAGE_SIZE
        events_new, results_size = fetch_events_page(error_id, per_page: PAGE_SIZE, offset: events.last[:id])
        events.concat(events_new)
      end

      events
    end

    def fetch_events_page(error_id, options={})
      events = Bugsnag::Api.error_events(error_id, options); print '.'
      [events, events.size]
    end

    def extract_usernames(events)
      events.map do |event|
        "#{event[:meta_data][:User][:name]}, ##{event[:meta_data][:User][:id]}"
      end.compact.uniq.sort
    end
  end
end
