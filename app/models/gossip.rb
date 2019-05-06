class Gossip < ApplicationRecord
    validates :title, length: { in: 3..14}, presence: true
    validates :content, presence: true

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :taggables
    has_many :tags, through: :taggables
    has_many :likes, dependent: :destroy
    has_many :users, through: :likes
end
