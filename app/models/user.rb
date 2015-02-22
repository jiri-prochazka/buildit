class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :role, type: String
  field :email, type: String
  field :encrypted_password, type: String, default: ""
  field :failed_attempts, type: Integer
  field :unlock_token, type: String
  field :locked_at, type: DateTime
  field :name, type: String
  field :surname, type: String
  field :phone, type: String


  devise :database_authenticatable, :registerable, :lockable, :timeoutable

  validates :email, presence: true, uniqueness: true
  validates :name, :surname, presence: true

  has_many :addresses, dependent: :destroy
  has_many :concepts

  after_create :set_as_customer

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
    self.update_attribute(:_type, "Customer")
    self.update_attribute(:role, "customer")
  end
   
end
