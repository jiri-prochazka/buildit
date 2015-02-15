class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :lockable, :timeoutable

  validates :email, presence: true, uniqueness: true
  validates :name, :surname, presence: true

  has_many :addresses, dependent: :destroy
  has_many :concepts

  before_create :set_as_customer

  accepts_nested_attributes_for :addresses

  ROLES = %w[customer manager admin]
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role) unless role.blank?
  end

  def self.roles
    ROLES
  end

  def account_label
  	name.to_s + ' ' + surname.to_s
  end

  private

  def set_as_customer
  	self.type = "Customer"
    self.role = "customer"
  end
         
end
