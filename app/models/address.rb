class Address < ApplicationRecord

  validates :cep, presence: true, length: { maximum: 30 }
  validates_presence_of :number, :street, :district, :city, :state

  belongs_to :contact
end
