require 'digest/md5'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts, :through => :post_category, :dependent => :destroy
  has_many :comments #:through => post, :dependent => :destroy
  has_and_belongs_to_many :roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def user_role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
end