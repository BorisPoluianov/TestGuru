class CreateTestProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :test_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.integer :answers, default: 0

      t.timestamps
    end
  end
end
