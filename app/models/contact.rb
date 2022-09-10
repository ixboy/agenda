class Contact < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :full_name, presence: true, length: { maximum: 30 }
  validates :cpf, presence: true, length: { minimum: 11, maximum: 11 }, format: { with: /\d/ }, 
                    uniqueness: { case_sensitive: true }
  validates :birth_date, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }

  belongs_to :user
  has_one :address,             dependent: :delete
  accepts_nested_attributes_for :address
  paginates_per 20
  default_scope { order(created_at: :desc) }
  def self.search(search)
    if search
      t = Contact.arel_table
      where(t[:full_name].matches("#{search}%"))
    else
      all
    end
  end
end