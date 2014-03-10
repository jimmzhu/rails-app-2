class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    validates :password, length: { minimum: 6 }

    # NOTE:
    # email uniqueness isn't guaranteed by the :uniqueness option
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)+\z/i
    validates :email, presence: true,
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

    # adds password & password_confirmation attributes
    # checks for presence of password
    # requires password password_confirmation to match
    # adds an 'authenticate' method
    # assumes presence of a 'password_digest' column in db
    # (includes validation for password_digest attribute)
    has_secure_password
end
