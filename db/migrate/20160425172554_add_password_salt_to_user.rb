class AddPasswordSaltToUser < ActiveRecord::Migration
  def change
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
    remove_column :users, :password
  end
end
