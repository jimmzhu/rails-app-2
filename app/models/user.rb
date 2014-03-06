class User < ActiveRecord::Base
    # create getters & setters
    attr_accessor :name, :email
    attr_accessible :name, :email

    def initialize(attributes = {})
        @name = attributes[:name]
        @email = attributes[:email]
    end

    def formatted_email
        "#{@name} <#{@email}>"
    end
end
