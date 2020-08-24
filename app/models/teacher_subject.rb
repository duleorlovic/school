class TeacherSubject < ApplicationRecord
  DEFAULT_LEVEL = 5

  belongs_to :teacher
  belongs_to :subject

  # This validation does not work well when we update subject with
  # teacher_subjects_attributes since it ignores that we mark_for_destruction
  # so keep this validation logic only in database as uniq index
  # validates :teacher, uniqueness: {scope: :subject}

  validates :level, presence: true
  before_validation :_default_values_on_create, on: :create

  def _default_values_on_create
    self.level ||= DEFAULT_LEVEL
    # return value should be true or nil
    true
  end
end
