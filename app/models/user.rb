class User < ActiveRecord::Base
  has_many :memberships
  has_many :accounts, through: :memberships

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def owned_accounts
    Account.where(owner: self)
  end

  def all_accounts
    owned_accounts + accounts
  end
end
