class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :lockable, :timeoutable

  validates :email, presence: true, uniqueness: true

  has_many :addresses
  has_many :concepts
         
end
