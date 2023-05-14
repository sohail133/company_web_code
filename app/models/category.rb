class Category < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  has_many :portfolios
end
