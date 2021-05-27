class User < ApplicationRecord
  has_many :expenses, foreign_key: :author_id, dependent: :destroy
  has_many :groups, foreign_key: :author_id

  validates_uniqueness_of :username
  validates :username, presence: true, length: { minimum: 3, maximum: 25 }
end
