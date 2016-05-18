class ChangeStripeConnectFieldsOnUser < ActiveRecord::Migration
  def change
    remove_column :users, :name
    remove_column :users, :address
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :tos_date, :datetime
    add_column :users, :tos_ip, :string
  end
end
