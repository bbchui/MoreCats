class ChangeUser < ActiveRecord::Migration
  def change
    change_column :users, :session_token, :string
  end
end
