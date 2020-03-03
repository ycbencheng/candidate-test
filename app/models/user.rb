class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  #Not including guest since it doesn't require login
  enum role: [:user, :editor, :admin]

  #set a default role for new users
  after_initialize do
    if self.new_record?
      self.role ||= :user
    end
  end
end
