class User < ApplicationRecord
  has_many :expenses, foreign_key: :author_id, dependent: :destroy
  has_many :groups, foreign_key: :author_id

 
end
