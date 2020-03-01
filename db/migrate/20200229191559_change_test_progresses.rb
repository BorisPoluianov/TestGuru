class ChangeTestProgresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :test_progresses, :question_id, :current_question_id
    rename_column :test_progresses, :answers, :questions_passed
    change_column_null :test_progresses, :user_id, true
    change_column_null :test_progresses, :test_id, true
    change_column_null :test_progresses, :current_question_id, true
  end
end
