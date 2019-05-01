class Gossip < ApplicationRecord
    validates :title, length: { in: 3..14}, presence: true
    validates :content, presence: true

    belongs_to :user
end
