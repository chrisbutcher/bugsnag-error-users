require 'test_helper'

class BugsnagErrorUsers::FetcherTest < Minitest::Test
  def setup
    $stdout = StringIO.new # suppress puts / print calls during test
  end

  def test_fetch_returns_sorted_users_list_from_error_url
    first_result = {meta_data: {User: {name: 'user2@domain.com', id: 2}}}
    second_result = {meta_data: {User: {name: 'user1@domain.com', id: 1}}}

    mock_results = [first_result, second_result]
    Bugsnag::Api.expects(:error_events).with('1234', {per_page: 100}).returns(mock_results)

    fetcher = BugsnagErrorUsers::Fetcher.new("https://bugsnag.com/myorganization/myproject/errors/1234")
    result = fetcher.fetch

    assert_equal ["user1@domain.com, #1", "user2@domain.com, #2"], result
  end

  def test_invalid_bugsnag_error_url
    fetcher = BugsnagErrorUsers::Fetcher.new("https://someother.domain/1234")

    result = fetcher.fetch
    assert_equal [], result
  end
end
