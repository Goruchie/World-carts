class Group < ApplicationRecord
    belongs_to :users, foreign_key: :user_id
    belongs_to :entities, foreign_key: :author_id
    has_many :entities, foreign_key: :group_id
end
