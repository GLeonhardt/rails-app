class Contact < ApplicationRecord
  validates_uniqueness_of :name, scope: :user_id

  has_many :phones
  belongs_to :user
end
