class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :username, :string
    add_column :users, :access_token, :string
  end
end
