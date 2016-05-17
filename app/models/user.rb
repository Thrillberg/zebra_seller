# == Schema Information
#
# Table name: users
#
#  id                :integer
#  email             :string
#  password          :string
#  password_digest   :string
#

class User < ActiveRecord::Base
  acts_as_authentic

  has_one :shopping_cart

  def seller?
    stripe_account_type == 'managed'
  end
end
