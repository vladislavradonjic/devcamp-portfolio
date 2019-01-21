class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, #ovo znaci validacija sign upa putem emaila
  #:lockable, #lock a user out based on amount of wrong user/password pairs
  #:timeoutable, #time out a user after some time
  #:trackable 
  #and :omniauthable integrate 3rd party logins, like facebook or google or something like that.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  validates_presence_of :name

  def first_name
  	self.name.split.first
  end

  def last_name
  	self.name.split.last
  end

end
