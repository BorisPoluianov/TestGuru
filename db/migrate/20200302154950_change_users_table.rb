class ChangeUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
    rename_column :users, :password, :password_digest
  end
end
