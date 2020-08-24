require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:math)
  end

  test 'should get index' do
    get subjects_url
    assert_response :success
  end

  test 'should get new' do
    get new_subject_url
    assert_response :success
  end

  test 'should create subject' do
    assert_difference('Subject.count') do
      post subjects_url, params: {subject: {description: @subject.description, name: @subject.name}}
    end

    assert_redirected_to subject_url(Subject.last)
  end

  test 'should show subject' do
    get subject_url(@subject)
    assert_response :success
  end

  test 'should get edit' do
    get edit_subject_url(@subject)
    assert_response :success
  end

  test 'should update subject' do
    patch subject_url(@subject), params: {subject: {description: @subject.description, name: @subject.name}}
    assert_redirected_to subject_url(@subject)
  end

  test 'should destroy subject' do
    assert_difference('Subject.count', -1) do
      delete subject_url(@subject)
    end

    assert_redirected_to subjects_url
  end

  test 'should clear teachers' do
    refute_equal 0, @subject.teachers.size
    patch subject_url(@subject), params: {subject: {teacher_ids: []}}
    assert_redirected_to subject_url(@subject)
    assert_equal 0, @subject.teachers.size
  end

  test 'should update teachers' do
    math_subject = subjects(:math)
    english_teacher = teachers(:english_teacher)
    patch subject_url(math_subject), params: {subject: {teacher_ids: [english_teacher.id]}}
    assert_redirected_to subject_url(@subject)
    assert_equal [english_teacher], @subject.teachers
  end
end
