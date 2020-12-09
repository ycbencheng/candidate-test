class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles

  #Not including guest since it doesn't require login
  enum role: [:user, :editor, :admin]

end
