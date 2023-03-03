class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable,  and :omniauthable, :validatable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable

  def full_name
    "#{first_name} #{middle_name[0]}. #{last_name}"
  end
end
