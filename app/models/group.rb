class Group < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :entities
end
