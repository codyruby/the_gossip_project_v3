class User < ApplicationRecord
    has_secure_password
    attr_accessor :remember_token

    validates :first_name, :last_name, :city_id, presence: true
    # Validation de l'email par une présence obligatoire et unique avec un format particulier
    validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
    belongs_to :city
    has_many :gossips
    has_many :comments
    has_many :likes, dependent: :destroy
    has_many :gossips, through: :likes

    class << self
        # Returns the hash digest of the given string.
        def digest(string)
          cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                        BCrypt::Engine.cost
          BCrypt::Password.create(string, cost: cost)
        end
    
        # Returns a random token.
        def new_token
          SecureRandom.urlsafe_base64
        end
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

     # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
        return false if remeber_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a user.
    def forget
        update_attribute(:remember_digest, nil)
    end
end
