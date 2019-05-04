class User < ApplicationRecord
    has_secure_password

    validates :first_name, :last_name, :city_id, presence: true
    # Validation de l'email par une présence obligatoire et unique avec un format particulier
    validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
    belongs_to :city
    has_many :gossips
    has_many :comments
end
