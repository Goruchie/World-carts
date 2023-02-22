class Entity < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :group, foreign_key: :group_id

  validates :name, length: { maximum: 80 }, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end
