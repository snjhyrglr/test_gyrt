class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable, :validatable,
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable
end
