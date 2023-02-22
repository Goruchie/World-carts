class Group < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :entities

  validates :name, length: { maximum: 80 }, presence: true

  def self.total_amount(group)
    total_amount = 0
    group.entities.each do |entity|
      total_amount += entity.amount
    end
    total_amount
  end
end
