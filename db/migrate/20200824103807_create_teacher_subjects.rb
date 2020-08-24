class CreateTeacherSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_subjects do |t|
      t.references :teacher
      t.references :subject
      t.integer :level

      t.timestamps
    end
  end
end
