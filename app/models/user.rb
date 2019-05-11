class User < ApplicationRecord
    validates_presence_of :name
    validates_uniqueness_of :name

    validates_numericality_of :age, greater_than: 0, allow_nil: true

    has_many :contacts
end
