class User < ApplicationRecord
  # has_many :cars, dependent: :destroy
  acts_as_token_authenticatable
  # field :authentication_token
  #User.create(email: 'aros@test.com' , password: 'testest', password_confirmation: 'testest')
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


end
