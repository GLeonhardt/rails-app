class Phone < ApplicationRecord
  belongs_to :contact

  validates_uniqueness_of :number, scope: :contact_id

  before_save do
    if self.default_phone
      contact.phones.each do |phone|
        phone.update! default_phone: false
      end
    end
  end

end
