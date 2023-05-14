class Contact < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true
  enum status: { pending: 0, accepted: 1, rejected: 2 }  
  attribute :read, :boolean, default: false
end
