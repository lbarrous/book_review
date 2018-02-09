class Reviewer < ActiveRecord::Base
  has_secure_password	
  validates_presence_of :password, on: :create
  validates :email, uniqueness: true, presence: true
  has_many :books
end
