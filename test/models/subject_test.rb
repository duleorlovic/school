require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test 'valid fixture' do
    assert_valid_fixture subjects
  end
end
