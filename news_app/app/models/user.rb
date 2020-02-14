class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :articles, dependent: :destroy

  after_initialize :set_default_role

  enum role: [:user, :editor, :admin]

  private
  def set_default_role
    self.role ||= :user
  end
end
