class User < ApplicationRecord
  # this is a callback to tell the db when to create the default role.
  after_create :assign_default_role

  rolify
  has_many :messages
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# this is now assigning every User database entry the role of a Moderator AS WELL AS the role of member because member is the default role.
  # user = User.last
  # user.add_role :moderator, Message


  # This is to add a default role.
   def assign_default_role
     self.add_role(:member) if self.roles.blank?
   end
end
