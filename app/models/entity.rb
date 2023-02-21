class Entity < ApplicationRecord
    belongs_to :users, foreign_key: :user_id
    belongs_to :groups, foreign_key: :group_id
    has_many :groups, foreign_key: :author_id
end
