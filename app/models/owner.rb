class Owner < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  has_many :buildings,
    inverse_of: :owner,
    dependent: :nullify
end
