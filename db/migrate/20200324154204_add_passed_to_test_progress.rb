class AddPassedToTestProgress < ActiveRecord::Migration[6.0]
  def change
    add_column :test_progresses, :passed, :boolean, default: false
  end
end
