require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  test 'validate first_name last_name presence' do
    teacher = Teacher.new first_name: ''
    teacher.save
    assert teacher.errors[:first_name].present?
    assert teacher.errors[:last_name].present?
  end
  test 'valid fixture' do
    assert_valid_fixture subjects
  end
end
