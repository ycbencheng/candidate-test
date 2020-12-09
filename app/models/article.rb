class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :user, presence: true
end
