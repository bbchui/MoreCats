class ChangeUserAgain < ActiveRecord::Migration
  def change
    change_column :users, :session_token, :string, null: true
  end
end
