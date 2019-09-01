class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :progress
  has_many :todos, through: :progress

  def has_todo?(todo)
   self.todos.each do |t|
     return true if t == todo
   end
   false
  end
end
