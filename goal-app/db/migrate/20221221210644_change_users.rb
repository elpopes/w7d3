class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :session_token, :string
    add_column :users, :password_digest, :string
    remove_column :users, :password
  end
end
