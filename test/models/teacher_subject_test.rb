require 'test_helper'

class TeacherSubjectTest < ActiveSupport::TestCase
  test 'uniq inidex on teacher and subject' do
    math_teacher = teachers(:math_teacher)
    math = subjects(:math)
    assert_raises(ActiveRecord::RecordNotUnique) do
      TeacherSubject.create teacher: math_teacher, subject: math
    end
  end

  test 'valid fixture' do
    assert_valid_fixture teachers
  end
end
