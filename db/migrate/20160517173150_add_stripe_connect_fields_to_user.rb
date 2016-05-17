class AddStripeConnectFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :ssn, :string
    add_column :users, :address, :string
    add_column :users, :date_of_birth, :string
  end
end
