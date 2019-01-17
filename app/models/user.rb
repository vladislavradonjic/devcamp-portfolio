class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, #ovo znaci validacija sign upa putem emaila
  #:lockable, #lock a user out based on amount of wrong user/password pairs
  #:timeoutable, #time out a user after some time
  #:trackable 
  #and :omniauthable integrate 3rd party logins, like facebook or google or something like that.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
end
